dir=$(dirname $1)
cd $dir
basename=$(basename $1)
filename="${basename%.*}"
interaction="nonstopmode"
pdflatex --draftmode --shell-escape $basename
makeglossaries "$filename"  || true
makeindex "$filename"  || true
pdflatex --shell-escape --interaction $interaction $basename  || true
bibtex "$filename"  || true
makeglossaries "$filename"  || true
makeindex "$filename"  || true
pdflatex --shell-escape --interaction $interaction $basename  || true
bibtex "$filename"  || true
pdflatex --shell-escape --interaction $interaction $basename  || true
pdflatex --shell-escape --interaction $interaction $basename  || true
rm -f *.aux *.out *.log *.bbl *.blg *.lst *.idx *~ *.*~* *.backup *.nav *.snm *.toc *.xwm
