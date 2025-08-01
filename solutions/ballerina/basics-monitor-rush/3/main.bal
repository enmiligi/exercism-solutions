type Request record {|
    readonly int cubicle;
|};

function allocateCubicles(int[] requests) returns int[] {
    table<Request> key(cubicle) result =
        table key(cubicle) from int cubicle in requests
    select {cubicle};
    return result.keys().sort();
}
