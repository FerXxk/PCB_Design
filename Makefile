PROJECT=pcb_manu

.PHONY: all erc drc gerbers bom pdf clean

all: erc drc pdf gerbers bom

erc:
	kicad-cli sch erc $(PROJECT).kicad_sch

drc:
	kicad-cli pcb drc $(PROJECT).kicad_pcb

gerbers:
	mkdir -p fabrication/gerbers
	kicad-cli pcb export gerber --output fabrication/gerbers/ --layers F.Cu,B.Cu,F.SilkS,B.SilkS,F.Mask,B.Mask,Edge.Cuts $(PROJECT).kicad_pcb
	kicad-cli pcb export drill --output fabrication/gerbers/ $(PROJECT).kicad_pcb

bom:
	mkdir -p fabrication/bom
	kicad-cli sch export bom --output fabrication/bom/$(PROJECT).csv $(PROJECT).kicad_sch

pdf:
	mkdir -p docs
	kicad-cli sch export pdf --output docs/$(PROJECT)_schematic.pdf $(PROJECT).kicad_sch
	kicad-cli pcb export pdf --output docs/$(PROJECT)_pcb.pdf --layers F.Cu,B.Cu,Edge.Cuts,F.SilkS $(PROJECT).kicad_pcb

clean:
	rm -rf fabrication docs
