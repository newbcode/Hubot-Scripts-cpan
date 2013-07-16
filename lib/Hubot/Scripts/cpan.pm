package Hubot::Scripts::cpan;

use utf8;
use strict;
use warnings;
use Encode;
use LWP::UserAgent;
use Data::Printer;

sub load {
    my ( $class, $robot ) = @_;

    $robot->hear(
        qr/(\w+::\w+)/i,    
        \&cpan_serach,
    );
}

sub cpan_serach {
    my $msg = shift;
    my $user_input = $msg->match->[0];

    my $ua = LWP::UserAgent->new;

    my $rep = $ua->get("https://metacpan.org/search?q=$user_input");
    #my $rep = $ua->get("http://search.cpan.org/search?mode=all&query=$user_input");
   
    if ($rep->is_success) {
        #my @info_name = $rep->decoded_content =~ m{<a href="/module/$user_input">(.*?)</a>}gsm;
        if ( $rep->decoded_content =~ m{<a
                href="/module/$user_input">$user_input</a>(.*?).*?</strong>}gsm ) {
            print "$1\n";
        }
    }
    else {
        die $rep->status_line;
    }
}

1;

=pod

=head1 Name 

    Hubot::Scripts::cpan
 
=head1 SYNOPSIS

    naver perl cafe (new issue) monitoring.
    perlstudy on - naver cafe(perlstudy) to start monitoring.
    perlstudy off|finsh - naver cafe(perlstudy) to stop monitoring.
    perlstudy status - naver cafe(perlstudy) status.
 
=head1 AUTHOR

    YunChang Kang <codenewb@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Yunchang Kang.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself
 
=cut
