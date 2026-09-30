#!/usr/bin/env python3
# Claude: this script is written by Claude (19 September 2026).
"""Generate a relocatable ELF object whose .rela.text carries one relocation
of every type in a range, against one named symbol, for reading a tool's
relocation type names off its output:

    mkreloc.py 64 183 0 1200 aarch64.o          # ELF64, e_machine 183 (AArch64)
    mkreloc.py 32 3 0 255 i386.o                # ELF32, e_machine 3 (i386)
    mkreloc.py 64 21 0 300 ppc64.o big          # big-endian

    readelf -W -r aarch64.o | awk 'NR>3{print $3}'
    diff <(readelf -W -r aarch64.o) <(linksem readelf -r aarch64.o)

This is how linksem's relocation name tables were checked against readelf
(see notes/notes007, section D): the names are
observed behaviour, not copied source."""
import struct, sys
def obj(cls64, machine, types, little=True):
    E='<' if little else '>'
    names=b'\0.text\0.symtab\0.strtab\0.shstrtab\0.rela.text\0'
    def off(n): return names.index(n)
    strtab=b'\0a\0'
    if cls64:
        sym=lambda name,info,shndx,val,size: struct.pack(E+'IBBHQQ',name,info,0,shndx,val,size)
        rela=lambda o,s,t,a: struct.pack(E+'QQq',o,(s<<32)|t,a)
        ehsize,shentsize,symsz,relasz=64,64,24,24
    else:
        sym=lambda name,info,shndx,val,size: struct.pack(E+'IIIBBH',name,val,size,info,0,shndx)
        rela=lambda o,s,t,a: struct.pack(E+'IIi',o,(s<<8)|t,a)
        ehsize,shentsize,symsz,relasz=52,40,16,12
    symtab=sym(0,0,0,0,0)+sym(1,0x03,1,0,0)  # a LOCAL SECTION-ish symbol? use STT_SECTION=3
    relas=b''.join(rela(0,1,t,0) for t in types)
    body=b''; secs=[]
    def add(data, name, typ, flags=0, link=0, info=0, align=1, entsize=0):
        nonlocal body
        o=ehsize+len(body); body+=data
        secs.append((off(name),typ,flags,0,o,len(data),link,info,align,entsize))
    secs.append((0,0,0,0,0,0,0,0,0,0))
    add(b'', b'.text', 1, 6)
    add(symtab, b'.symtab', 2, 0, 3, 2, 8, symsz)
    add(strtab, b'.strtab', 3)
    add(names, b'.shstrtab', 3)
    add(relas, b'.rela.text', 4, 0x40, 2, 1, 8, relasz)
    shoff=ehsize+len(body)
    if cls64:
        sh=b''.join(struct.pack(E+'IIQQQQIIQQ',n,t,f,a,o,s,l,i,al,es) for (n,t,f,a,o,s,l,i,al,es) in secs)
        eh=b'\x7fELF'+bytes([2,1 if little else 2,1,0])+b'\0'*8+struct.pack(E+'HHIQQQIHHHHHH',1,machine,1,0,0,shoff,0,ehsize,0,0,shentsize,len(secs),4)
    else:
        sh=b''.join(struct.pack(E+'IIIIIIIIII',n,t,f,a,o,s,l,i,al,es) for (n,t,f,a,o,s,l,i,al,es) in secs)
        eh=b'\x7fELF'+bytes([1,1 if little else 2,1,0])+b'\0'*8+struct.pack(E+'HHIIIIIHHHHHH',1,machine,1,0,0,shoff,0,ehsize,0,0,shentsize,len(secs),4)
    return eh+body+sh
cls64=sys.argv[1]=='64'; machine=int(sys.argv[2]); lo,hi=int(sys.argv[3]),int(sys.argv[4]); out=sys.argv[5]
little = (len(sys.argv)<7 or sys.argv[6]!='big')
open(out,'wb').write(obj(cls64,machine,range(lo,hi+1),little))
