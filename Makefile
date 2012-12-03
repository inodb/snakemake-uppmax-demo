OUTPUT=$(shell echo test{0..9}.txt)

MULTIOUTPUT1=multioutput0.txt
MULTIOUTPUT2=multioutput1.txt
MULTIOUTPUT=multioutput.success

all: $(OUTPUT) $(MULTIOUTPUT)

test%.txt: 
	echo test$* > $@

$(MULTIOUTPUT): $(OUTPUT)
	cat $< > $(MULTIOUTPUT1)
	cat $^ > $(MULTIOUTPUT2)

clean:
	-rm -f $(OUTPUT) $(MULTIOUTPUT) $(MULTIOUTPUT1) $(MULTIOUTPUT2)

.PHONY: all clean
