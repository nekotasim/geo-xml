#!/user/local/bin/perl

use Jcode;
use LWP::Simple;
use URI::Escape;
use XML::Simple;
use Data::Dumper;

#csvを開く
open(csv,"geo.csv") || die(next);

my @csv_data = <csv>;
my $csv_length = @scv_data;


close(csv);

open(fh,">geo.txt") || die(next);

for(my $i =0; $i < 10; $i++){
	
	my @split_data = split("\,", $csv_data[$i]);
	my $query = ${split_data[0]};
	$query = Jcode->new($query, 'utf8')->utf8;
	$query = uri_escape($query);
	my $url = "http://www.geocoding.jp/api/?v=1.1&q=$query";
	my $document = LWP::Simple::get($url) or die "cannot get content from $url";

	my $parser = XML::Simple->new;
	my $data = $parser->XMLin($document);

	print fh Dumper($data). "\n";

}
close(fh);
exit;