PROJECT = jxa-html

JXA_SRC = $(wildcard src/*.jxa)
JXA_OUT = $(patsubst src/%.jxa, ebin/%.beam, $(JXA_SRC))

all: deps app bin/joxa $(JXA_OUT)

include erlang.mk

bin/joxa:
	@mkdir -p bin
	@curl -L -o $@ https://gist.githubusercontent.com/camshaft/b5f1047d6749459e90a5/raw/joxa
	@chmod +x $@

ebin/%.beam: src/%.jxa
	@ERL_LIBS=deps ./bin/joxa -o ebin -c $<
