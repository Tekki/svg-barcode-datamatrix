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

## dotsize

    $value      = $datamatrix->dotsize;
    $datamatrix = $datamatrix->dotsize($newvalue);
    $datamatrix = $datamatrix->dotsize('');          # 1

Getter and setter for the size of the dots. Default `1`.

## encoding\_mode

    $value      = $datamatrix->encoding_mode;
    $datamatrix = $datamatrix->encoding_mode($newvalue);
    $datamatrix = $datamatrix->encoding_mode('');          # AUTO

Getter and setter for the encoding mode.
One of `AUTO`, `ASCII`, `C40`, `TEXT`, `BASE256`, or `NONE`. Default `AUTO`.

## process\_tilde

    $value      = $datamatrix->process_tilde;
    $datamatrix = $datamatrix->process_tilde($newvalue);
    $datamatrix = $datamatrix->process_tilde('');          # 0

Getter and setter for the tilde flag.
If set to `1` the tilde character `~` is being used to recognize special characters.
Default `0`.

## size

    $value      = $datamatrix->size;
    $datamatrix = $datamatrix->size($newvalue);
    $datamatrix = $datamatrix->size('');          # AUTO

Getter and setter for the module size of the matrix.
`height x width`, one of `AUTO`, `10x10`, `12x12`, `14x14`, `16x16`, `18x18`, `20x20`, `22x22`, `24x24`, `26x26`, `32x32`, `36x36`, `40x40`, `44x44`, `48x48`, `52x52`, `64x64`, `72x72`, `80x80`, `88x88`, `96x96`, `104x104`, `120x120`, `132x132`, `144x144`, `8x18`, `8x32`, `12x26`, `12x36`, `16x36`, `16x48`.
Default `AUTO`.

# SEE ALSO

[SVG::Barcode](https://metacpan.org/pod/SVG::Barcode), [Barcode::DataMatrix](https://metacpan.org/pod/Barcode::DataMatrix).

# AUTHOR & COPYRIGHT

© 2019 by Tekki (Rolf Stöckli).

This program is free software, you can redistribute it and/or modify it under the terms of the Artistic License version 2.0.
