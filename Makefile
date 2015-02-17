all: clean epub pdf

CONTENT := \
		content/000-meta.yaml \
		content/film-*.md \
		content/tv-*.md \
		content/comics-*.md \
		content/themes-*.md

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
		-V geometry:margin=1.2in \
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

upload:
	@echo " --> Uploading EPUB"
	./scripts/drive-linux-amd64 -c .gdrive upload -p 0BwbNGSC-B22KfnB4X1JscGFlUV8wa0d4eUJhT2NyQ1NjeDFTSXNYR0ZiRlgtaUY4eUdNcHc -f VisualRhetoric.epub
	@echo " --> Uploading PDF"
	./scripts/drive-linux-amd64 -c .gdrive upload -p 0BwbNGSC-B22KfnB4X1JscGFlUV8wa0d4eUJhT2NyQ1NjeDFTSXNYR0ZiRlgtaUY4eUdNcHc -f VisualRhetoric.pdf

