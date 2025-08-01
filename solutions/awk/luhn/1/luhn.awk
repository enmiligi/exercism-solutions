BEGIN {}
{
    if ($0 ~ /[^0-9 ]/)
        print "false";
    else {
        gsub(/ /, "");
        split($0, chars, //);
        if (length(chars) < 2)
            print "false";
        else {
            sum = 0;
            for (i in chars) {
                num = int(chars[length(chars) - i + 1]);
                if (i % 2 == 0) {
                    if (num * 2 > 9)
                        sum += num * 2 - 9;
                    else
                        sum += num * 2;
                }
                else
                    sum += num;
            }
            if (sum % 10 == 0)
                print "true"
            else
                print "false"
        }
    }
}