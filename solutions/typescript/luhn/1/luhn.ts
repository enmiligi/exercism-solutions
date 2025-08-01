export function valid(digitString: string): boolean {
  var sum = 0
  var digitIndex = 0
  for (var char of [...digitString].reverse()) {
    if (char == ' ') continue
    if (/\D/.test(char)) return false
    var d2 = digitIndex % 2 != 0 ? Number(char)*2 : Number(char)
    if (d2 > 9) d2 = d2 - 9
    sum += d2
    digitIndex++
  }
  return digitIndex > 1 && sum % 10 == 0
}
