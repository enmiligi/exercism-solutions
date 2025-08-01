pub fn build_proverb(list: &[&str]) -> String {

    if list.is_empty() {
        return String::new();
    }

    let nail = list[0];
    let mut s = list.windows(2)
        .map(|pair| match pair {
            [shoe, horse] => format!("For want of a {shoe} the {horse} was lost.\n"),
            _ => String::new()
        })
        .collect::<String>();
    s.push_str(format!("And all for the want of a {nail}.").as_str());
    return s;
}
