pub fn actions(n: u8) -> Vec<&'static str> {
    let mut n = n;
    let mut instructions = vec![];
    for i in ["wink", "double blink", "close your eyes", "jump"] {
        if n & 1 == 1 {
            instructions.push(i);
        }
        n = n >> 1;
    }
    if n & 1 == 1 {
        instructions.reverse()
    }
    instructions
}
