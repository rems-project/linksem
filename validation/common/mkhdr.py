#!/usr/bin/env python3
# Claude: this script is written by Claude (19 September 2026).
"""Write a bare ELF64 little-endian header with the given e_machine, EI_OSABI
and e_version, for reading a tool's name tables off `readelf -h`:

    mkhdr.py 183 0 1 h.elf && readelf -h h.elf | grep Machine

Looping over 0..65535 for e_machine, 0..255 for EI_OSABI (per machine, since
the values from 64 up are architecture-specific) and a few EI_VERSION values
gave the tables in linksem's elf_header.lem."""
import struct, sys
# a bare ELF64 little-endian header with the given e_machine, EI_OSABI and e_version
machine, osabi, version, out = int(sys.argv[1]), int(sys.argv[2]), int(sys.argv[3]), sys.argv[4]
eh=b'\x7fELF'+bytes([2,1,1,osabi])+b'\0'*8+struct.pack('<HHIQQQIHHHHHH',1,machine,version,0,0,0,0,64,0,0,64,0,0)
open(out,'wb').write(eh)
