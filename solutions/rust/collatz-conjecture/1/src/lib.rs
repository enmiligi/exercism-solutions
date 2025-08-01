pub fn collatz(n: u64) -> Option<u64> {
    if n < 1 {
        return None;
    }
    let mut num = Some(n);
    let mut steps = 0;
    while let Some(n) = num {
        if n == 1 {
            return Some(steps);
        }
        if n & 1 == 1 {
            num = n.checked_mul(3).and_then(|number| number.checked_add(1))
        } else {
            num = n.checked_div(2);
        }
        steps += 1;
    }
    None
}
