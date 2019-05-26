# NAME

SVG::Barcode::DataMatrix - Generator for SVG based QR Codes

# SYNOPSIS

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

# DESCRIPTION

[SVG::Barcode::DataMatrix](https://metacpan.org/pod/SVG::Barcode::DataMatrix) is a generator for SVG based QR Codes.

# FUNCTIONS

## plot\_datamatrix

    use SVG::Barcode::DataMatrix 'plot_datamatrix';

    $svg = plot_datamatrix($text, %params);

Returns a QR Code using the provided text and parameters.

# CONSTRUCTOR

## new

    $datamatrix = SVG::Barcode::DataMatrix->new;            # create with defaults
    $datamatrix = SVG::Barcode::DataMatrix->new(%params);

Creates a new QR Code plotter. Inherited from [SVG::Barcode](https://metacpan.org/pod/SVG::Barcode#new).

# METHODS

## plot

    $svg = $datamatrix->plot($text);

Creates a SVG code. Inherited from [SVG::Barcode](https://metacpan.org/pod/SVG::Barcode#plot).

# PARAMETERS

Inherited from [SVG::Barcode](https://metacpan.org/pod/SVG::Barcode):
[background](https://metacpan.org/pod/SVG::Barcode#background),
[class](https://metacpan.org/pod/SVG::Barcode#class),
[foreground](https://metacpan.org/pod/SVG::Barcode#foreground),
[height](https://metacpan.org/pod/SVG::Barcode#height),
[id](https://metacpan.org/pod/SVG::Barcode#id),
[margin](https://metacpan.org/pod/SVG::Barcode#margin),
[width](https://metacpan.org/pod/SVG::Barcode#width).

## level

    $value  = $datamatrix->level;
    $datamatrix = $datamatrix->level($newvalue);
    $datamatrix = $datamatrix->level('');          # M

Getter and setter for the error correction level.
One of one of `L` (low), `M` (medium), `Q` (quartile), `H` (high). Default `M`.

## size

    $value  = $datamatrix->size;
    $datamatrix = $datamatrix->size($newvalue);
    $datamatrix = $datamatrix->size('');          # 1

Getter and setter for the size of the dots. Default `1`.

## version

    $value  = $datamatrix->version;
    $datamatrix = $datamatrix->version($newvalue);
    $datamatrix = $datamatrix->version('');          # 0

Getter and setter for the symbol version.
From `1` to `40`. `0` will adapt the version to the required capacity. Default `0`.

# SEE ALSO

[SVG::Barcode](https://metacpan.org/pod/SVG::Barcode), [Text::DataMatrix](https://metacpan.org/pod/Text::DataMatrix).

# AUTHOR & COPYRIGHT

© 2019 by Tekki (Rolf Stöckli).

This program is free software, you can redistribute it and/or modify it under the terms of the Artistic License version 2.0.
