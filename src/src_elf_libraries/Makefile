dummy: all

extract:
	mkdir batteries uint
	tar -zxvf batteries-2.2.tar.gz -C batteries --strip-components=1
	tar -zxvf uint.tar.gz -C uint --strip-components=1

clean:
	rm -rf batteries uint

make-batteries:
	make -C batteries all

make-uint:
	make -C uint configure
	make -C uint all

all: extract make-batteries make-uint