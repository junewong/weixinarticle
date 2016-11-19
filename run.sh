today=`date +"%Y-%m-%d"`

file="htmls/${today}.html"
index="htmls/index.html"

echo "Starting ..."
./multicrawl.sh
./convert2html.sh origin_contet.txt > $file
cp $file $index
echo "Done"
