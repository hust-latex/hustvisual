@default_files = ('hustvisual.dtx');

# IMPORTANT: Add the `./visuals/' directory to the TeX search path,
# enabling the direct use of \DocInput in the hustvisual.dtx file.
# If you do not use latexmk, you should manually modify the `TEXINPUTS',
# or gather all files in the `./visuals/' directory into the hustvisual.dtx directory.
ensure_path( 'TEXINPUTS', './visuals//' );

$_latex_arguments = '-synctex=1 -shell-escape -file-line-error',
$_silent_switch = '-interaction=nonstopmode';

$pdflatex = "pdflatex $_latex_arguments %O %S";
$xelatex = "xelatex $_latex_arguments %O %S";

$silence_logfile_warnings = 1;

$out_dir = 'build';
$pdf_mode = 5; # xelatex
$show_time = 1;

# Process index
$makeindex = "makeindex -s gind.ist %O -o %D %S";

# Process glossary (change history)
add_cus_dep('glo', 'gls', 0, 'makeglo2gls');
$makeglossaries = 'makeglossaries';
sub makeglo2gls {
	system("makeindex -s gglo.ist -o \"$_[0].gls\" -t \"$_[0].glg\" \"$_[0].glo\"");
}
