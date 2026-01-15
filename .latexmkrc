$jobname = "thesis";
$output_dir = "build";
$pdf_mode = 1;

# Enable shell escape for minted package
$pdflatex = "pdflatex -shell-escape -synctex=1 %O %S";

# Use biber for bibliography processing
$bibtex_use = 2;  # Use biber instead of bibtex
