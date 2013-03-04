package Test::CT::TestFile;
# ABSTRACT: Test::CT::TestFile keep status of a piece of a test
use Moose;

has name => (
    is => 'ro',
    isa => 'Str',
    required => 1,
);

has coderef => (
    is => 'ro',
    isa => 'Any',
    required => 1,
);

has has_run => (
    is => 'rw',
    isa => 'Bool',
    default => sub {0}
);

has error => (
    is => 'ro',
    isa => 'Str',
);



1;

__END__

=pod

=head1 NAME

Test::CT::TestFile - Test::CT::TestFile keep status of a piece of a test

=head1 VERSION

version 0.1

=head1 AUTHOR

Renato Cron <rentocron@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Renato Cron.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
