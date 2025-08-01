class Transcriptor {
  toRna(dna_string: string) {
    if (
      dna_string
        .replace(/[GCTA]/g, "")
    ) {
      throw "Invalid input DNA.";
    }
    return dna_string
      .replace(/G/g, "c")
      .replace(/C/g, "g")
      .replace(/T/g, "a")
      .replace(/A/g, "u")
      .toUpperCase();
  }
}

export default Transcriptor;
