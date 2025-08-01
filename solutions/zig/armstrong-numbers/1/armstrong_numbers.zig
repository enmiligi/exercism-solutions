const math = @import("std").math;

pub fn isArmstrongNumber(num: u128) bool {
    if (num == 0) {
        return true;
    }
    const n_digits = math.log10(num) + 1;
    var digits = [_]u128{0} ** 39;
    var n = num;
    var i: usize = 0;
    while (n > 0) : ({
        n /= 10;
        i += 1;
    }) {
        digits[i] = n % 10;
    }
    var sum: u256 = 0;
    for (digits) |digit| {
        sum += math.pow(u128, digit, n_digits);
    }
    return sum == num;
}
