
use strict;
use warnings;

use 5.010;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "DBI-based session engine for Dancer",
  "AUTHOR" => "James Aitken <jaitken\@cpan.org>",
  "BUILD_REQUIRES" => {
    "Dancer" => 0,
    "Test::More" => 0,
    "warnings" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Dancer-Session-DBI",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Dancer::Session::DBI",
  "PREREQ_PM" => {
    "DBI" => 0,
    "Dancer::Config" => 0,
    "Dancer::Logger" => 0,
    "Dancer::Session::Abstract" => 0,
    "JSON::XS" => 0,
    "Try::Tiny" => 0,
    "feature" => 0,
    "parent" => 0,
    "strict" => 0
  },
  "VERSION" => "0.1.0",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


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



