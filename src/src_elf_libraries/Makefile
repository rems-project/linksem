dummy: all

extract:
	mkdir batteries uint
	tar -zxvf batteries-2.2.tar.gz -C batteries --strip-components=1

clean:
	rm -rf batteries

make-batteries:
	make -C batteries all

all: extract make-batteries