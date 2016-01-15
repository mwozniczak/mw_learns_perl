#!/usr/bin/env perl

use Time::Piece;

sub parse_line {
    my $line = shift;
    $line =~ /^
        (?<username>\w+)\s+
        [\w\d\/]+\s+
        (?<host>[\w\d\.\-]+)\s+
        (?<weekday>\w{3})\s+
        (?<month>\w{3})\s+
        (?<day>\d{1,2})\s+
        (?<start>\d{2}:\d{2})
        (\s+\-\s+(?<end>\d{2}:\d{2}))?
        .*
        ((?<duration>\d{2}:\d{2})|(?<still>logged\sin))\)?$
    /x;
    return %+;
}

open(LOGS, "okapi.last");

my $weekday_durations = 0;
my $weekend_durations = 0;

my $total_overtime = 0;

my $FULL_DAY = 1440; # 24:00
my $OVERTIME_START = 1080; # 18:00
my $OVERTIME_END = 420; # 07:00

@weekdays = qw/mon tue wed thu fri/;
@weekends = qw/sat sun/;

sub get_minutes {
    ($hours, $minutes) = split /:/, shift;
    return $hours * 60 + $minutes;
}

sub max {
    $a = shift;
    $b = shift;
    return ($x, $y)[$x < $y];
}
sub min {
    $a = shift;
    $b = shift;
    return ($x, $y)[$x > $y];
}

for (<LOGS>) {
    my %res = parse_line($_);
    my @keys = sort keys %res;
    if ($res{"duration"}) {
        my $dur_minutes = get_minutes $res{"duration"};
        my $start_minutes = get_minutes $res{"start"};
        my $end_minutes = get_minutes $res{"end"};
        if (grep $_ eq lc $res{"weekday"}, @weekdays) {
            $weekday_durations += $dur_minutes;
            if ($end_minutes > $OVERTIME_START) {
                $total_overtime += $end_minutes - max($OVERTIME_START, $start_minutes);
            }
        } elsif (grep $_ eq lc $res{"weekday"}, @weekends) {
            $weekend_durations += $dur_minutes;
            #$total_overtime += $dur_minutes;
        }
    }
}
print "Weekday total: $weekday_durations minutes\n";
print "Weekend total: $weekend_durations minutes\n";
print "Overtime total: $total_overtime minutes\n"
