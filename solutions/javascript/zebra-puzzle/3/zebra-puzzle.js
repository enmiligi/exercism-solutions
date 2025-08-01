const colors = ["red", "green", "ivory", "yellow", "blue"];
const inhabitants = [
  "Englishman",
  "Spaniard",
  "Ukrainian",
  "Norwegian",
  "Japanese",
];
const pets = ["dog", "snails", "fox", "horse", "zebra"];
const beverages = ["coffee", "tea", "milk", "orange juice", "water"];
const cigarettes = [
  "Old Gold",
  "Kool",
  "Chesterfield",
  "Lucky Strike",
  "Parliament",
];
const idToValues = {
  color: colors,
  inhabitant: inhabitants,
  pet: pets,
  beverage: beverages,
  cigarette: cigarettes,
};

export class ZebraPuzzle {
  constructor() {
    this.colorNumber = this.houseNumberArray();
    this.inhabitantNumber = this.houseNumberArray();
    this.petNumber = this.houseNumberArray();
    this.beverageNumber = this.houseNumberArray();
    this.cigaretteNumber = this.houseNumberArray();
    this.idToArray = {
      color: this.colorNumber,
      inhabitant: this.inhabitantNumber,
      pet: this.petNumber,
      beverage: this.beverageNumber,
      cigarette: this.cigaretteNumber,
    };
    this.changed = true;
    this.solve();
  }

  houseNumberArray() {
    let result = Array(5);
    for (let i = 0; i < 5; i++) {
      result[i] = new Set([0, 1, 2, 3, 4]);
    }
    return result;
  }

  intersect(set1, set2) {
    return new Set([...set1].filter((element) => set2.has(element)));
  }

  mustBe(category1, value1, category2, value2) {
    let newSet = this.intersect(
      this.idToArray[category2][idToValues[category2].indexOf(value2)],
      this.idToArray[category1][idToValues[category1].indexOf(value1)]
    );
    this.changed ||= !this.setEquals(
      this.idToArray[category1][idToValues[category1].indexOf(value1)],
      newSet
    );
    this.changed ||= !this.setEquals(
      this.idToArray[category2][idToValues[category2].indexOf(value2)],
      newSet
    );
    this.idToArray[category1][idToValues[category1].indexOf(value1)] =
      this.idToArray[category2][idToValues[category2].indexOf(value2)] = newSet;
  }

  nextTo(category1, value1, category2, value2, left = true, right = true) {
    let houseNumbers1 =
      this.idToArray[category1][idToValues[category1].indexOf(value1)];
    let neighborNumbers1 = new Set();
    for (let number of houseNumbers1) {
      if (number > 0 && left) neighborNumbers1.add(number - 1);
      if (number < 4 && right) neighborNumbers1.add(number + 1);
    }
    let newSet = this.intersect(
      this.idToArray[category2][idToValues[category2].indexOf(value2)],
      neighborNumbers1
    );
    this.changed ||= !this.setEquals(
      this.idToArray[category2][idToValues[category2].indexOf(value2)],
      newSet
    );
    this.idToArray[category2][idToValues[category2].indexOf(value2)] = newSet;

    let houseNumbers2 =
      this.idToArray[category2][idToValues[category2].indexOf(value2)];
    let neighborNumbers2 = new Set();
    for (let number of houseNumbers2) {
      if (number > 0 && right) neighborNumbers2.add(number - 1);
      if (number < 4 && left) neighborNumbers2.add(number + 1);
    }
    newSet = this.intersect(
      this.idToArray[category1][idToValues[category1].indexOf(value1)],
      neighborNumbers2
    );
    this.changed ||= !this.setEquals(
      this.idToArray[category1][idToValues[category1].indexOf(value1)],
      newSet
    );
    this.idToArray[category1][idToValues[category1].indexOf(value1)] = newSet;
  }

  applyAbsoluteRules() {
    this.inhabitantNumber[inhabitants.indexOf("Norwegian")] = new Set([0]);
    this.beverageNumber[beverages.indexOf("milk")] = new Set([2]);
  }

  applyRules() {
    this.mustBe("inhabitant", "Englishman", "color", "red");
    this.mustBe("inhabitant", "Spaniard", "pet", "dog");
    this.mustBe("beverage", "coffee", "color", "green");
    this.mustBe("inhabitant", "Ukrainian", "beverage", "tea");
    this.mustBe("cigarette", "Old Gold", "pet", "snails");
    this.mustBe("cigarette", "Kool", "color", "yellow");
    this.mustBe("cigarette", "Lucky Strike", "beverage", "orange juice");
    this.mustBe("inhabitant", "Japanese", "cigarette", "Parliament");

    this.nextTo("color", "green", "color", "ivory", true, false);
    this.nextTo("cigarette", "Chesterfield", "pet", "fox");
    this.nextTo("cigarette", "Kool", "pet", "horse");
    this.nextTo("inhabitant", "Norwegian", "color", "blue");
  }

  cleanArray(array) {
    let counts = [0, 0, 0, 0, 0];
    let setIndex = [0, 0, 0, 0, 0];
    for (let index in array) {
      for (let element of array[index]) {
        counts[element]++;
        setIndex[element] = index;
      }
    }
    for (let index in counts) {
      if (counts[index] == 1) {
        let newSet = new Set([Number(index)]);
        this.changed ||= !this.setEquals(array[setIndex[index]], newSet);
        array[setIndex[index]] = newSet;
      }
    }
    let singletons = new Set();
    let singletonIndices = new Set();
    for (let index in array) {
      let set = array[index];
      if (set.size == 1) {
        for (let val of set) {
          if (!singletons.has(val)) {
            singletons.add(val);
            singletonIndices.add(index);
          }
        }
      }
    }
    for (let index in array) {
      if (!singletonIndices.has(index)) {
        let newSet = new Set(
          [...array[index]].filter((element) => !singletons.has(element))
        );
        this.changed ||= !this.setEquals(array[index], newSet);
        array[index] = newSet;
      }
    }
  }

  cleanArrays() {
    for (let key in this.idToArray) {
      this.cleanArray(this.idToArray[key]);
    }
  }

  finished() {
    let result = true;
    for (let key in this.idToArray) {
      for (let set of this.idToArray[key]) {
        if (set.size > 1) result = false;
      }
    }
    return result;
  }

  valid() {
    let result = true;
    for (let key in this.idToArray) {
      for (let set of this.idToArray[key]) {
        if (set.size < 1) result = false;
      }
    }
    return result;
  }

  findSmallestSet() {
    let set;
    let count = Infinity;
    let value = "";
    let category = "";
    for (let key in this.idToArray) {
      for (let index in this.idToArray[key]) {
        if (
          this.idToArray[key][index].size < count &&
          this.idToArray[key][index].size > 1
        ) {
          set = this.idToArray[key][index];
          count = set.count;
          value = idToValues[key][index];
          category = key;
        }
      }
    }
    return { set, value, category };
  }

  solve() {
    this.applyAbsoluteRules();

    this.changed = true;
    while (this.changed) {
      this.changed = false;
      this.cleanArrays();

      this.applyRules();
    }

    if (!this.valid()) return false;
    if (this.finished()) return true;
    let { set, value, category } = this.findSmallestSet();
    for (let number of set.values()) {
      this.idToArray[category][idToValues[category].indexOf(value)] = new Set([
        number,
      ]);
      if (this.solve()) {
        return true;
      }
      this.idToArray[category][idToValues[category].indexOf(value)] = set;
    }
  }

  setEquals(set1, set2) {
    return (
      set1.size == set2.size && new Set([...set1, ...set2]).size == set1.size
    );
  }

  get(category1, value1, category2) {
    let number =
      this.idToArray[category1][idToValues[category1].indexOf(value1)];
    for (let index in this.idToArray[category2]) {
      if (this.setEquals(this.idToArray[category2][index], number)) {
        return idToValues[category2][index];
      }
    }
  }

  waterDrinker() {
    return this.get("beverage", "water", "inhabitant");
  }

  zebraOwner() {
    return this.get("pet", "zebra", "inhabitant");
  }
}
