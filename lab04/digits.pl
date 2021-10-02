#!/usr/bin/perl -w

while ($line = <>) {
	# print $line;
	# for (_ in $line) {
	# 	if (_ < 5) {
	# 		s/_/</g;
	# 	}
	# 	else{
	# 		s/_/>/g;
	# 	}
	# }
	$line =~ s/0|1|2|3|4/</g;
	$line =~ s/6|7|8|9/>/g;
	print "$line";
}


