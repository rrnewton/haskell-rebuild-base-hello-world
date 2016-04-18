

.PHONY: all run

all:
	docker build -t rebuild-ghc-base .

run:

	docker run -it rebuild-ghc-base
