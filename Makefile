all: clean epub pdf

CONTENT := \
		content/000-meta.yaml \
		content/*.md

clean:
	rm -f VisualRhetoric.*

epub:
	pandoc -f markdown -t epub3  \
		--toc \
		--epub-stylesheet content/epub.css \
		-o VisualRhetoric.epub \
		$(CONTENT)

pdf:
	pandoc -f markdown \
		--chapters \
		--variable mainfont=Georgia \
		--template content/template.tex \
		--toc \
		-o VisualRhetoric.pdf \
		$(CONTENT)

tex:
	pandoc -f markdown \
		--chapters \
		--template content/template.tex \
		--toc \
		-o VisualRhetoric.tex \
		$(CONTENT)

