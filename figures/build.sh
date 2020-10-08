#!/usr/bin/env bash

for f in n0; do
  pdflatex $f.tex
  pdflatex $f.tex
  pdflatex $f.tex
  pdfcrop $f.pdf
  convert -density 600 $f-crop.pdf -quality 90 -size 512x512 $f.png
  rm $f.aux $f.log $f.pdf $f-crop.pdf
done
