function roundOnTwoDigits(number: number) {
  return Number(number.toFixed(2));
}

export default class SpaceAge {
  seconds: number;
  earthYears: number;

  constructor(seconds: number) {
    this.seconds = seconds;
    this.earthYears = seconds / 31557600;
  }

  onEarth(): number {
    return roundOnTwoDigits(this.earthYears);
  }

  onMercury() {
    return roundOnTwoDigits(this.earthYears / 0.2408467);
  }

  onVenus() {
    return roundOnTwoDigits(this.earthYears / 0.61519726);
  }

  onMars() {
    return roundOnTwoDigits(this.earthYears / 1.8808158);
  }

  onJupiter() {
    return roundOnTwoDigits(this.earthYears / 11.862615);
  }

  onSaturn() {
    return roundOnTwoDigits(this.earthYears / 29.447498);
  }

  onUranus() {
    return roundOnTwoDigits(this.earthYears / 84.016846);
  }

  onNeptune() {
    return roundOnTwoDigits(this.earthYears / 164.79132);
  }
}
