pub fn reply(message: &str) -> &str {
    let m = message.trim();
    let is_question = m.ends_with("?");
    let is_yelled = m.chars().any(char::is_alphabetic) && message.to_uppercase() == message;
    let is_empty = m.trim().is_empty();
    match (is_question, is_yelled, is_empty) {
        (_, _, true) => "Fine. Be that way!",
        (true, true, _) => "Calm down, I know what I'm doing!",
        (true, _, _) => "Sure.",
        (_, true, _) => "Whoa, chill out!",
        _ => "Whatever.",
    }
}
