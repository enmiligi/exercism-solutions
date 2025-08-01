# Returns the acronym of the given phrase.
#
# + phrase - a string
# + return - the acronym
function abbreviate(string phrase) returns string {
    string new_phrase = re `_`.replace(phrase, " ");
    var words = re `[ -]`.split(new_phrase.toUpperAscii());
    var letters = words.map(
        function(string s) returns string {
        if s.length() == 0 {
            return "";
        } else {
            return s.substring(0, 1);
        }
    }
    );
    return string:concat(...letters);
}
