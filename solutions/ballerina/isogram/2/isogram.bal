public function isIsogram(string sentence) returns boolean {
    var new_sentence = re `[ \-]`.replace(sentence.toLowerAscii(), "");
    map<int> chars = {};
    foreach var c in new_sentence {
        if chars.hasKey(c) {
            return false;
        } else {
            chars[c] = 1;
        }
    }
    return true;
}
