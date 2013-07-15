package Hubot::Scripts::perlstudy;

use utf8;
use strict;
use warnings;
use Encode;
use LWP::UserAgent;
use Data::Printer;

sub load {
    my ( $class, $robot ) = @_;
    my $flag = 'off';
 
    $robot->hear(
        qr/(\w+::\w+)/i,    
    );
}

sub cpan_serach {
    my $msg = shift;
    my $user_input = $msg->match->[0];
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
