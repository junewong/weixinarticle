source ~/.wxrc

log (){
	today=`date +"%Y-%m-%d"`
	time=`date +"%Y-%m-%d %H:%M:%S"`
	echo "[$time] $*" |tee -a logs/${today}.log
}

today=`date +"%Y-%m-%d"`

file="htmls/${today}.html"
index="htmls/index.html"

log "Starting ..."
git pull
./multicrawl.sh
./convert2html.sh origin_contet.txt > $file
cp $file $index
log "Done"

log "try to callback $WX_CAllBACk ..."
if [[ -e "$WX_CAllBACk" ]];then
	sh $WX_CAllBACk
fi
