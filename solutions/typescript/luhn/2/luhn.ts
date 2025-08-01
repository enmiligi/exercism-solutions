export function valid(digitString: string): boolean {
  digitString = digitString.replaceAll(/\s/g, "")
  if (/[^\d ]/.test(digitString)) return false
  if (digitString.length < 2) return false
  var digits = [...digitString].map(Number)
  for (var i = digits.length - 2; i >= 0; i -= 2) {
    digits[i] = digits[i] * 2
    if (digits[i] > 9) digits[i] -= 9
  }
  return digits.reduce((a,b) => a + b, 0) % 10 == 0
}
