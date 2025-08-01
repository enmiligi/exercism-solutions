// from https://exercism.io/tracks/typescript/exercises/space-age/solutions/ae7fca1df60e479ba585a91ce145344c
interface Planets {
  [key: string]: number;
}

interface SpaceAge {
  [key: string]: any;
}

const Planets: Planets = {
  Mercury: 0.2408467,
  Venus: 0.61519726,
  Earth: 1,
  Mars: 1.8808158,
  Jupiter: 11.862615,
  Saturn: 29.447498,
  Uranus: 84.016846,
  Neptune: 164.79132,
};

class SpaceAge {
  constructor(public seconds: number) {
    for (const planet in Planets) {
      this["on" + planet] = () => this.convert(Planets[planet]);
    }
  }

  convert(ratio: number) {
    return Number((this.seconds / 31557600 / ratio).toFixed(2));
  }
}

export default SpaceAge;
