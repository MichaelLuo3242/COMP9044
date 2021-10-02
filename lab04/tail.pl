#!/usr/bin/perl -w

$N = -10;
foreach $arg (@ARGV) {

    # $arg =~ s/[\<\>]//g;

    if ( $arg gt 0 && $arg !~ /[A-Za-z]+[0-9]+.txt/) {
        print "$0: version 0.1\n";
        die "\n";
    }
    else {
    	if ($arg gt 0){
    		push @files, $arg;
    	}
    	else{
    		$N = $arg;
    	}
    }
}

if (@files){
    foreach $file (@files) {
        open F, '<', $file or die "$0: Can't open $file: $!\n";
        $file_num = @files;

        if ($file_num gt 1){
            print "==> $file <==\n";
        }

        my @lines;
        while ($line = <F>){
            push @lines, $line;
        }

        $line_num = @lines;
        $start = $line_num - abs($N);
        if ($start < 0) {
            $start = 0;
            # print "$start";
        }

        while ($start < $line_num) {
            print "$lines[$start]";
            $start += 1;
        }

        close F;
    }
}
else{
    my @lines;
    while ($line = <stdin>){
        push @lines, $line;
    }

    $line_num = @lines;
    $start = $line_num - abs($N);
    if ($start < 0) {
        $start = 0;
        # print "$start";
    }

    while ($start < $line_num) {
        print "$lines[$start]";
        $start += 1;
    }
}




