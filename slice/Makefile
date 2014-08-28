SLICE_CXX_COMPILE=slice2cpp
SLICES=Printer.ice
SLICES_OUTPUT=Printer.h Printer.cpp
SLICES_HEADER=Printer.h
SLICES_SOURCE=Printer.cpp

Printer.h Printer.cpp:
	$(SLICE_CXX_COMPILE) Printer.ice

install:$(SLICES_OUTPUT)
	cp $(SLICES_HEADER) ../include/
	cp $(SLICES_SOURCE) ../src/

clean:
	rm -rf $(SLICES_OUTPUT)

