const math = @import("std").math;
const print = @import("std").debug.print;

fn digits(num: *const u128) u64 { // own function because log10 rounds when number too large
    var n = num.*;
    var ans: u64 = 0;
    while (n > 0) : (ans += 1) n /= 10;
    return ans;
}

pub fn isArmstrongNumber(num: u128) bool {
    if (num == 0) return true;
    const n_digits = digits(&num);
    var n = num;
    var sum: u128 = 0;
    while (n > 0) : (n /= 10) {
        sum += math.pow(u128, n % 10, n_digits);
    }
    return sum == num;
}
