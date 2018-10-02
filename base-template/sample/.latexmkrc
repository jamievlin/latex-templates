sub asy {
    if ($^O eq "MSWin32") {
    return system("wsl asy \"$_[0]\"");
    } else {
    return system("asy \"$_[0]\"");
    }
}

add_cus_dep("asy","eps",0,"asy");
add_cus_dep("asy","pdf",0,"asy");
add_cus_dep("asy","tex",0,"asy");

@default_files=('sample.tex');
$pdf_mode=1;

$clean_ext = "pre bbl synctex.gz run.xml";
