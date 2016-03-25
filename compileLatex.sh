!#/bin/bash

NAME=thesis_main

if [ ! -d "build" ]; then
  mkdir build
fi

pdflatex -output-directory build/ $NAME.tex
if [ $? -eq 0 ]; then 
  echo "Producing pdf"
else
  echo "FAIL" 
  exit $?; fi
  
cp Bibliography/*.bib build

cd build 

bibtex $NAME
echo "Linking bibliography"

cd .. 

pdflatex -output-directory build/ $NAME.tex
if [ $? -eq 0 ]; then 
  echo "Producing pdf"
else
  echo "FAIL" 
  exit $?; fi

pdflatex -output-directory build/ $NAME.tex
if [ $? -eq 0 ]; then 
  echo "Producing pdf"
else
  echo "FAIL" 
  exit $?; fi

mv build/$NAME.pdf .
