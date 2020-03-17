# 2020-03-17, Jan de Cuveland

all: topology.pdf

topology.pdf: topology.gv
	neato -Goverlap=false -Tpdf $< -o $@

topology.gv: topology.txt
	./ibtopviz $< $@

topology.txt:
	ssh node0 ibnetdiscover >$@

clean:
	$(RM) topology.gv topology.pdf

.PHONY: clean
