file=$1

echo '
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta id="viewport" name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<title>微信公众号文章</title>
</head>
<body>
'
	

cat $file |while read line
do
	url=`echo $line |cut -d"^" -f1`
	title=`echo $line |cut -d"^" -f2`
	date=`echo $line |cut -d"^" -f3`
	echo "<p><a href='$url'>$title</a>&nbsp;&nbsp;<span style='color:light-gray;'>$date</span></p>"

done

echo "
</body>
</html>
"
