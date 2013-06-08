
use strict;
use warnings;

use 5.006;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "*Mix* of Test::More + Test::Reuse + Test::Routine, with *template* system.",
  "AUTHOR" => "Renato Cron <rentocron\@cpan.org>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Test-CT",
  "EXE_FILES" => [
    "bin/ct-build",
    "bin/ct-init"
  ],
  "LICENSE" => "perl",
  "NAME" => "Test::CT",
  "PREREQ_PM" => {
    "App::Prove" => 0,
    "Data::Dumper" => 0,
    "File::Find" => 0,
    "File::Spec" => 0,
    "File::Spec::Functions" => 0,
    "Getopt::Long" => 0,
    "Moose" => 0,
    "Moose::Exporter" => 0,
    "MooseX::Singleton" => 0,
    "Pod::Usage" => 0,
    "Test::More" => 0,
    "YAML::Tiny" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {},
  "VERSION" => "0.142",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



