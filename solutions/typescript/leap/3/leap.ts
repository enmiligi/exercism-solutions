// from https://exercism.io/tracks/typescript/exercises/leap/solutions/65250eaa5a9f4de1a406c89ddbeacf88
function isLeapYear(year: number): boolean {
  const divisibleBy = (n: number) => year % n === 0;
  return divisibleBy(4) && !divisibleBy(100) || divisibleBy(400);
}

export default isLeapYear;
