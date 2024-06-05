LoadPackage( "AutoDoc" );
LoadPackage("P-subgroups");
AutoDoc( rec( scaffold := rec(latex_header_file:="doc/latexhead.tex"),
              autodoc  := rec( files := [ "doc/chapters.autodoc" ])
));
QUIT;

