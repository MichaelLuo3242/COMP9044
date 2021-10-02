#!/usr/bin/perl -w


if (@ARGV != 2){
	print "Usage: ./echon.pl <number of lines> <string>\n";
	exit 1;
}

if ($ARGV[0] !~ /[0-9]+/ || $ARGV[0] lt 0){
	print "./echon.pl: argument 1 must be a non-negative integer\n";
	exit 1;
}else{
	$number = $ARGV[0];
}

while (($number gt 0)){
	print "$ARGV[1]\n";
	$number -= 1;
}