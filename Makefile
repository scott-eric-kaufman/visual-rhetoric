all: clean epub

clean:
	rm -f VisualRhetoric.*

epub:
	pandoc -f markdown -t epub  \
		--toc \
		--epub-stylesheet content/epub.css \
		-o VisualRhetoric.epub \
		content/000-meta.yaml \
		content/*.md

