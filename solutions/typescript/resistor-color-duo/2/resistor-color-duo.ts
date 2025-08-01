// from https://exercism.io/tracks/typescript/exercises/resistor-color-duo/solutions/2274b8e8da8545fa9b0ec6de6f488734
export class ResistorColor {
  private colors: string[];
  private static COLOR_VALUES = [
    "black",
    "brown",
    "red",
    "orange",
    "yellow",
    "green",
    "blue",
    "violet",
    "grey",
    "white",
  ];

  constructor(colors: string[]) {
    if (colors.length < 2) {
      throw "At least two colors need to be present";
    }
    this.colors = colors;
  }
  value = (): number => {
    return Number(
      this.colors.slice(0, 2).map((color: string) =>
        ResistorColor.COLOR_VALUES.indexOf(color)
      ).join(
        "",
      ),
    );
  };
}
