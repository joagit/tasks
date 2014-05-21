# to use bluetooth, I found the following in first comment at
# www.katescomment.com/programming-lego-mindstorms-nxt-nxc-macos-osx/
# nxtcom -v -S=/dev/tty.NXT-DevB myProgram.rxe

# Config
USB=-U
BLUETOOTH=-v -S=/dev/tty.NXT-DevB

# Path to the NXC compiler
NXC=/Applications/NXT/nbc
NXTCOM=/Applications/NXT/nxtcom_scripts/nxtcom

# Options to pass to the compiler
OPTIONS=-Z2 -EF

# Change the name of the program helloworld.rxe to be whatever you want
# to name the final executable
PROGRAM=tasks

all: compile download

compile: $(PROGRAM).rxe

$(PROGRAM).rxe: source/$(PROGRAM).nxc Makefile
	cd source;                    \
	$(NXC) -O=../build/$(PROGRAM).rxe \
			$(OPTIONS) \
			$(PROGRAM).nxc;

download: $(PROGRAM).rxe
	cd build;  \
	$(NXTCOM) $(USB) $(PROGRAM).rxe

clean:
	/bin/rm -vf build/$(PROGRAM).rxe
