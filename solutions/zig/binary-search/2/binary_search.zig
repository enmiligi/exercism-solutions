// Take a look at the tests, you might have to change the function arguments
pub const SearchError = error{ ValueAbsent, EmptyBuffer };
const print = @import("std").debug.print;

pub fn binarySearch(comptime T: type, target: T, buffer: ?[]const T) SearchError!usize {
    if (buffer == null or buffer.?.len == 0) return SearchError.EmptyBuffer;
    const list = buffer.?;
    var mid: usize = list.len / 2;
    var begin: usize = 0;
    var end: usize = list.len;
    while (begin < end) : (mid = (begin + end) / 2) {
        if (list[mid] == target) {
            return mid;
        } else if (target > list[mid]) {
            begin = mid + 1;
        } else {
            end = mid;
        }
    }
    return SearchError.ValueAbsent;
}
