default: html
.PHONY: html default rsync

html: ld.texinfo linksem.texi
	makeinfo --html --split-size=5000000 -I . ld.texinfo

# for srk's use only, for now
rsync: html
	rsync -av ld srk31@sandy.cl.cam.ac.uk:public_html/private/tmp/linksem
