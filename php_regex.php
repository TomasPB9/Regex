<?php

$file = fopen("/Users/carlostomas/Documents/Data engineering/REGEX/results_history_soccer.csv", "r");

$match = 0;
$nomatch = 0 ;

while(!feof($file)){
    $line = fgets($file);
    #empieza la REGEX
    if(preg_match(
        '/^2018\-01\-(\d\d),.*$/',
        $line,                                                                    
        $m
        )
    ){
    print_r($m);
    $match++;
    } else{
        $nomatch++;
    }
    echo $line;
}
fclose($file);

printf("\n\nmatch %d\nno match %d\n" , $match, $nomatch)