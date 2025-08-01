def parse:
    if test("^-?[0-9]+$") then {type: "push", element: tonumber}
    elif test("^(\\+|-|\\*|\\/|dup|drop|swap|over)$") then 
        {type: "builtin", operation: .}
    elif test(": .* ;") then 
        capture(": (?<name>[^\\s]*) (?<definition>.*) ;") 
        | .type = "definition"
    else {type: "word", name: .} end
;

def exception: halt_error(1);

def no_zero_args:
    if .stack | length == 0 then
        "empty stack" | exception
    else . end
;

def not_one_arg:
    if .stack | length == 1 then
        "only one value on the stack" | exception 
    else . end
;

def two_args_builtin(operation): no_zero_args | not_one_arg |
    .stack = .stack[:-2] + (.stack[-2:] | operation)
;

def one_args_builtin(operation):
    no_zero_args | .stack = .stack[:-1] + (.stack[-1] | operation)
;


def divide:
    if .[1] == 0 then "divide by zero" | exception
    else .[0]/.[1] | floor end
;

def executeBuiltin($operation):
    if $operation == "+" then two_args_builtin([add])
    elif $operation == "-" then two_args_builtin([.[0] - .[1]])
    elif $operation == "*" then two_args_builtin([.[0] * .[1]])
    elif $operation == "/" then two_args_builtin([divide])
    elif $operation == "dup" then one_args_builtin([., .])
    elif $operation == "drop" then one_args_builtin([])
    elif $operation == "swap" then two_args_builtin([.[1], .[0]])
    elif $operation == "over" then two_args_builtin([.[0], .[1], .[0]])
    else . end
;

def splitInstructions:
    [scan(": [^;]* ;")] + # collect definitions
    (gsub("^\\s+|: [^;]* ;|\\s+$"; "") # trim and remove definitions
    | split("\\s+"; "l"))
;

# input: {stack: list, definitions: object}
def execute($instructions):
    reduce $instructions[] as $instruction (
        .;
        if $instruction.type == "push" then .stack += [$instruction.element]
        elif $instruction.type == "builtin" then
            if .definitions | has($instruction.operation) then
                execute([{type: "word", name: $instruction.operation}])
            else executeBuiltin($instruction.operation) end
        elif $instruction.type == "definition" then
            if $instruction.name | test("^-?[0-9]+") then
                "illegal operation" | exception
            else
                .definitions = 
                    (.definitions | 
                        (.[$instruction.name] = 
                            {code: $instruction.definition, definitions: .}))
            end
        elif $instruction.type == "word" then
            if .definitions | has($instruction.name) then
                (.definitions | .[$instruction.name] | .code
                    | splitInstructions | map(parse))  as $wordInstructions
                    | .definitions as $ds
                    # temporarily set definitions to what they were
                    # at the time the word was defined
                    | .definitions = 
                        (.definitions | .[$instruction.name] | .definitions)
                        | execute($wordInstructions)
                    # reset the definitions
                    | .definitions = $ds
            else
                "undefined operation" | exception
            end
        else . end
    )
;


{stack:[], definitions: 
    {PROG: {code: .instructions | join(" ") | ascii_downcase,
            definitions: {}}}}
    | execute([{type: "word", name: "PROG"}])
    | .stack