all: clean epub

clean:
	rm -f VisualRhetoric.*

epub:
	pandoc -f markdown -t epub -o VisualRhetoric.epub content/*.md

