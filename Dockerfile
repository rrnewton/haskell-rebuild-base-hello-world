
FROM fpco/stack-build:lts-5.13

RUN apt-get install git

# git@github.com:ghc/ghc.git

RUN git clone https://github.com/ghc/ghc.git  /ghc && \
    cd /ghc && git checkout ghc-7.10.3-release && \
    cd / && mv /ghc/libraries/base /ghc-base && \
    rm -rf /ghc


RUN cd /ghc-base && autoconf && autoreconf && aclocal
RUN cd /ghc-base && ./configure

RUN cd /ghc-base && cabal configure -finteger-gmp2 && cabal build

RUN ghc-pkg list base && \
    cabal install /ghc-base

# RUN
