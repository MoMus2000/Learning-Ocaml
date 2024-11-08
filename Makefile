OCAML = ocamlc
TARGET = main

all: $(TARGET)

$(TARGET): main.ml
	$(OCAML) -o $(TARGET) main.ml

clean:
	rm -f $(TARGET) *.cmo *.cmi

compile:
	ocamlopt -o $(TARGET) main.ml

wash:
	rm -f $(TARGET) *.cmx *.o

