dummy: all

extract:
	mkdir -p batteries
	mkdir -p ocaml-uint
	tar -zxvf batteries-2.2.tar.gz -C batteries --strip-components=1
	tar -zxvf ocaml-uint-master.tar.gz -C ocaml-uint --strip-components=1

clean:
	rm -rf batteries
	rm -rf ocaml-uint

make-batteries:
	make -C batteries all
	make -C ocaml-uint configure
	make -C ocaml-uint all

all: extract make-batteries
