/[^ACGT]/ {
    print "Invalid nucleotide detected.";
    exit 1;
}
{
    gsub(/G/, "c");
    gsub(/C/, "G");
    gsub(/c/, "C");
    gsub(/A/, "U");
    gsub(/T/, "A");
    print $0;
}
