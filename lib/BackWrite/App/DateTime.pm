package BackWrite::App::DateTime;
use base 'DateTime';

sub parse {
    my ( $class, $string ) = @_;

    # parse date
    my $dt;
    if($string =~ /^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d+$/){
        my ( $date, $time ) = split /T/, $string;
        my ( $y, $m, $d ) = split /-/, $date;
        my ( $h, $M, $s ) = split /:/, $time;

        eval {
            $dt = DateTime->new(
                year   => $y,
                month  => $m,
                day    => $d,
                hour   => $h,
                minute => $M,
                second => $s
            ) || undef;
        };
    }

    return $dt || $string;
}

1;
