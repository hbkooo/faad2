V ?= @

MYARCH := x86-darwin-gcc
SRC = faad2-2.7
MY_LOCAL_PATH = $(PWD)
PREFIX := $(MY_LOCAL_PATH)/$(MYARCH)

usage:
	@echo "usage: make all| config | build | clean"
	@echo "cwd = $(MY_LOCAL_PATH)"
 
all: clean config build
 
config:
	cd $(SRC); ./configure --prefix=$(PREFIX) --exec-prefix=$(PREFIX)
build: config
	$(V)make -C $(SRC)
install: build
	$(V)make -C $(SRC) install
clean:
	$(V)make -C $(SRC) clean
