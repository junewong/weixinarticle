file=$1

echo '
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta id="viewport" name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<title>微信公众号文章</title>
	<style>
	.mutted {
		color:rgb(85,85,85);
		font-size:12px;
		margin-right:10px;
	}
	.item {
		margin-top:2px;
		margin-left:10px;
		margin-bottom:28px;
		border-bottom: 1px dashed lightgray;
	}
	.item a {
		color:dodgerblue;
		font-size:14px;
		font-weight:bold;
		text-decoration:none;
	}
	.item p {
		line-height: 10px;
	}
	</style>
</head>
<body>
'
	

cat $file |while read line
do
	author=`echo $line |cut -d"^" -f1`
	url=`echo $line |cut -d"^" -f2`
	title=`echo $line |cut -d"^" -f3`
	date=`echo $line |cut -d"^" -f4`
	echo "
		<div class='item'>
			<p><a href='$url'>$title</a></p>
			<p> <span class='mutted'>$date</span> <span class='mutted'>$author</span></p>
		</div>
	"

done

echo "
</body>
</html>
"
