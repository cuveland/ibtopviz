# 2020-03-17, Jan de Cuveland

all: topology.pdf

%.pdf: %.gv
	neato -Goverlap=false -Tpdf $< -o $@

%.gv: %.txt
	./ibtopviz $< $@

topology.txt:
	ssh node0 ibnetdiscover >$@

clean:
	$(RM) topology.gv topology.pdf

.PHONY: clean
