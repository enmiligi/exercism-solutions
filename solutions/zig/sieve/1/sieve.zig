const std = @import("std");

pub fn primes(buffer: []u32, comptime limit: u32) []u32 {
    var isPrime = std.StaticBitSet(limit + 1).initFull();
    if (limit < 2) return buffer[0..0];
    var numPrimes: usize = 0;
    for (2..limit + 1) |i| {
        if (isPrime.isSet(i)) {
            buffer[numPrimes] = @intCast(i);
            numPrimes += 1;
            var num = i * i;
            while (num <= limit) : (num += i) {
                isPrime.unset(num);
            }
        }
    }
    return buffer[0..numPrimes];
}
