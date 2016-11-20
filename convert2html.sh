file=$1

echo '
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta id="viewport" name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<title>微信订阅号文章</title>
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
		line-height: 14px;
	}
	nav {
		width:100%;
		padding-bottom:2px;
		text-align:center;
		background-color:skyblue;
		margin-bottom:10px;
	}
	nav h1 {
		padding-top:16px;
		color:white;
		font-size: 18px;
	}
	.footer {
		wdith:100%;
		text-align:center;
	}
	.footer a{
		color:darkgray;
		font-size:16px;
		text-decoration:none;
		padding-top: 20px;
		padding-bottom: 20px;
	}
	</style>
</head>
<body>
	<nav>
		<h1>微信订阅号文章</h1>
	</nav>
'
	

cat $file |while read line
do
	url=`echo $line |cut -d"^" -f1`
	author=`echo $line |cut -d"^" -f2`
	title=`echo $line |cut -d"^" -f3`
	date=`echo $line |cut -d"^" -f4`
	echo "
		<div class='item'>
			<p><a href='$url'>$title</a></p>
			<p> <span class='mutted'>$date</span> <span class='mutted'>$author</span></p>
		</div>
	"

done

echo '
	<div class="footer">
		<span><a href="./list.html"> 查看历史文章</a></span>
	</div>
</body>
</html>
'
