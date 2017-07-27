<!DOCTYPE html>
<html>
<head>
	<title>CommentPage</title>
</head>
<body>
<h1>Wait...</h1>
<?php
$commentUrl = $_POST["commentUrl"];

if($commentUrl != "")
{
	print "good job";
	echo("Congratulations!<br>");
   exec("ruby FBcatchComment.rb",$arr,$ret);
    echo("ret is $ret  <br>");
    for($x = 0,$fir = 0; $x < count($arr); $x++) {
    	
    	if($arr[$x] == "First comment")
    	{
    		$fir = 1;
    	}
    	if($fir == 1){
    		echo $arr[$x];
    		echo "<br>";
    	}


	}
}
?>
</body>
</html>