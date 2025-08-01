# Returns the acronym of the given phrase.
#
# + phrase - a string
# + return - the acronym
function abbreviate(string phrase) returns string {
    var words = re `[ \-_]+`.split(phrase.toUpperAscii());
    var letters = words.map(s => s[0]);
    return string:concat(...letters);
}
