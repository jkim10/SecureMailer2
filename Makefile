CFLAGS = -g -Wall
LDFLAGS =

install: mail-in mail-out
		 cp mail-in mail-out $(DEST)/bin

mail-in: mail-in.o mail_utils.o mail-out
	g++ -std=c++17 mail-in.o mail_utils.o -lstdc++fs -o mail-in

mail-out: mail-out.o mail_utils.o
	g++ -std=c++17 mail-out.o mail_utils.o -lstdc++fs -o mail-out

mail-in.o: mail-in.cpp
	g++ -std=c++17 -c mail-in.cpp

mail-out.o: mail-out.cpp
	g++ -std=c++17 -c mail-out.cpp

mail_utils.o: mail_utils.cpp
	g++ -std=c++17 -c mail_utils.cpp

.PHONY: test clean
clean: 
	rm -f *.o mail-in mail-out
