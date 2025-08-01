// Take a look at the tests, you might have to change the function arguments
pub const SearchError = error{ ValueAbsent, EmptyBuffer };

pub fn binarySearch(comptime T: type, target: T, buffer: ?[]const T) SearchError!usize {
    if (buffer.?.len == 0) return SearchError.EmptyBuffer;
    var mid: usize = buffer.?.len / 2;
    var begin: usize = 0;
    var end = buffer.?.len;
    var left: []const T = buffer.?[begin..mid];
    var right: []const T = buffer.?[mid..end];
    while (left.len > 0 and right.len > 0) {
        if (right[0] == target) {
            return mid;
        } else if (right[0] < target) {
            begin = mid;
            mid = mid + right.len / 2;
            left = buffer.?[begin..mid];
            right = buffer.?[mid..end];
        } else {
            end = mid;
            mid = mid - left.len / 2;
            left = buffer.?[begin..mid];
            right = buffer.?[mid..end];
        }
    }
    if (left.len == 0) {
        if (right[0] == target) {
            return mid;
        }
    } else {
        if (left[0] == target) {
            return mid - 1;
        }
    }
    return SearchError.ValueAbsent;
}
