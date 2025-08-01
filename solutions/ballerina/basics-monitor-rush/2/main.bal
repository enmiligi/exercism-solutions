type Request record {|
    readonly int cubicle;
|};

function allocateCubicles(int[] requests) returns int[] {
    table<Request> key(cubicle) result = table [];
    foreach int request in requests {
        result.put({cubicle: request});
    }
    return result.keys().sort();
}
