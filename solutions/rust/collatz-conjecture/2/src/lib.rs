pub fn collatz(n: u64) -> Option<u64> {
    if n < 1 {
        return None;
    }
    let mut num = n;
    let mut steps = 0;
    while num > 1 {
        if num & 1 == 1 {
            num = num.checked_mul(3)?.checked_add(1)?;
        } else {
            num = num.checked_div(2)?;
        }
        steps += 1;
    }
    Some(steps)
}
