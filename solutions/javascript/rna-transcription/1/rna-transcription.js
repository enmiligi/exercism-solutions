export const toRna = (dna_string) =>
  dna_string
    .replace(/G/g, "c")
    .replace(/C/g, "g")
    .replace(/T/g, "a")
    .replace(/A/g, "u")
    .toUpperCase();
