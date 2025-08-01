BEGIN {FS = ""}
{
    for (i=NF; i >= 1; i--)
        printf $i;
    print ""
}