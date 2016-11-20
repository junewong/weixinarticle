source /home/pi/.wxrc

log (){
	today=`date +"%Y-%m-%d"`
	time=`date +"%Y-%m-%d %H:%M:%S"`
	echo "[$time] $*" |tee -a logs/${today}.log
}

date=$1
if [[ "$date" = "" ]];then
	date=`date +"%Y-%m-%d"`
fi

file="htmls/${date}.html"
index="htmls/index.html"

log "Running for $date ..."
git pull
./multicrawl.sh $date
./convert2html.sh origin_contet.txt > $file
cp $file $index
log "done"

log "try to callback $WX_CAllBACk ..."
if [[ -e "$WX_CAllBACk" ]];then
	sh $WX_CAllBACk
fi

log "End"
