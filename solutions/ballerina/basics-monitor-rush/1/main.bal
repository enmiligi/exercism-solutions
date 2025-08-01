
function allocateCubicles(int[] requests) returns int[] {
    int[] requests_sorted = requests.sort();
    int last_request = 0;
    int[] result = [];
    foreach int request in requests_sorted {
        if request != last_request {
            result.push(request);
            last_request = request;
        }
    }
    return result;
}
