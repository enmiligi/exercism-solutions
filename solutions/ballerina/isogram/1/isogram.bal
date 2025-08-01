import ballerina/lang.regexp;

public function isIsogram(string sentence) returns boolean {
    var new_sentence = re `[ \-]`.replace(sentence.toLowerAscii(), "");
    string alphabet = "abcdefghijklmnopqrstuvwxyz";
    foreach var c in alphabet {
        var regex = checkpanic regexp:fromString(c);
        var matches = regex.findAll(new_sentence, 0).length();
        if matches > 1 {
            return false;
        }
    }
    return true;
}
