# codepoint of a: 97, z: 122
def encode_string:
    explode
    | map(if . >= 97 and (. <= 122) then
            122 - (. - 97) else . end)
    | implode
;

def encode:
    .input.phrase | sub("[^a-zA-Z0-9]"; ""; "g")
        | ascii_downcase
        | encode_string
        | [scan(".?{5}")] | join(" ")
;


def decode:
    .input.phrase | sub("\\s"; ""; "g")
        | encode_string
;

if .property == "encode" then encode else decode end