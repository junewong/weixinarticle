echo "Starting ..."
./multicrawl.sh
./convert2html.sh origin_contet.txt > index.html
echo "Done"
