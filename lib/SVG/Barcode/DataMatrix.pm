package SVG::Barcode::DataMatrix;
use parent 'SVG::Barcode';
use strict;
use warnings;
use utf8;
use v5.24;
use feature 'signatures';
no warnings 'experimental::signatures';

use Exporter 'import';
our @EXPORT_OK = qw|plot_datamatrix|;

use Barcode::DataMatrix;

our $VERSION = '0.03';

use constant DEFAULTS => {
  dotsize       => 1,
  encoding_mode => 'AUTO',
  process_tilde => 0,
  size          => 'AUTO',
};

SVG::Barcode::_param(__PACKAGE__, $_, DEFAULTS->{$_}) for keys DEFAULTS->%*;

# functions

sub plot_datamatrix ($text, %params) {
  return __PACKAGE__->new(%params)->plot($text);
}

# internal methods

sub _plot ($self, $text) {
  $self->{plotter}
    ||= Barcode::DataMatrix->new($self->%{qw|encoding_mode process_tilde size|});
  $self->_plot_2d($self->{plotter}->barcode($text), 1);
}

1;

=encoding utf8

=head1 NAME

SVG::Barcode::DataMatrix - Generator for SVG based QR Codes

=head1 SYNOPSIS

    use SVG::Barcode::DataMatrix;

    my $datamatrix = SVG::Barcode::DataMatrix->new;
    my $svg        = $datamatrix->plot('https://perldoc.pl');

    $datamatrix->dotsize;          # 1
    $datamatrix->encoding_mode;    # AUTO
    $datamatrix->process_tilde;    # 0
    $datamatrix->size;             # AUTO
                                   # from SVG::Barcode:
    $datamatrix->foreground;       # black
    $datamatrix->background;       # white
    $datamatrix->margin;           # 2
    $datamatrix->id;
    $datamatrix->class;
    $datamatrix->width;
    $datamatrix->height;

    my %params = (
      level  => 'H',
      margin => 4,
    );
    $datamatrix = SVG::Barcode::DataMatrix->new(%params);

    # use as function
    use SVG::Barcode::DataMatrix 'plot_datamatrix';

    $svg = plot_datamatrix('https://perldoc.pl', %params);

=head1 DESCRIPTION

L<SVG::Barcode::DataMatrix> is a generator for SVG based QR Codes.

=head1 FUNCTIONS

=head2 plot_datamatrix

    use SVG::Barcode::DataMatrix 'plot_datamatrix';

    $svg = plot_datamatrix($text, %params);

Returns a QR Code using the provided text and parameters.

=head1 CONSTRUCTOR

=head2 new

    $datamatrix = SVG::Barcode::DataMatrix->new;            # create with defaults
    $datamatrix = SVG::Barcode::DataMatrix->new(%params);

Creates a new QR Code plotter. Inherited from L<SVG::Barcode|SVG::Barcode/new>.

=head1 METHODS

=head2 plot

    $svg = $datamatrix->plot($text);

Creates a SVG code. Inherited from L<SVG::Barcode|SVG::Barcode/plot>.

=head1 PARAMETERS

Inherited from L<SVG::Barcode>:
L<background|SVG::Barcode/background>,
L<class|SVG::Barcode/class>,
L<foreground|SVG::Barcode/foreground>,
L<height|SVG::Barcode/height>,
L<id|SVG::Barcode/id>,
L<margin|SVG::Barcode/margin>,
L<width|SVG::Barcode/width>.

=head2 level

    $value  = $datamatrix->level;
    $datamatrix = $datamatrix->level($newvalue);
    $datamatrix = $datamatrix->level('');          # M

Getter and setter for the error correction level.
One of one of C<L> (low), C<M> (medium), C<Q> (quartile), C<H> (high). Default C<M>.

=head2 size

    $value  = $datamatrix->size;
    $datamatrix = $datamatrix->size($newvalue);
    $datamatrix = $datamatrix->size('');          # 1

Getter and setter for the size of the dots. Default C<1>.

=head2 version

    $value  = $datamatrix->version;
    $datamatrix = $datamatrix->version($newvalue);
    $datamatrix = $datamatrix->version('');          # 0

Getter and setter for the symbol version.
From C<1> to C<40>. C<0> will adapt the version to the required capacity. Default C<0>.

=head1 SEE ALSO

L<SVG::Barcode>, L<Text::DataMatrix>.

=head1 AUTHOR & COPYRIGHT

© 2019 by Tekki (Rolf Stöckli).

This program is free software, you can redistribute it and/or modify it under the terms of the Artistic License version 2.0.

=cut
