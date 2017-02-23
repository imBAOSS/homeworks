Array.prototype.myBubbleSort = function () {
  let sorted = false;
  while (!sorted) {
    sorted = true;
    for (let i = 0; i < this.length - 1; i++) {
      let j = i + 1;
      if (this[i] > this[j]) {
        this[j] = [this[i], this[i] = this[j]][0];
        sorted = false;
      }
    }
  }
  return this;
};

// console.log([4,2,6,4,78,7,4].myBubbleSort());

String.prototype.mySubString = function () {
  let substrings = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = i + 1; j <= this.length; j++) {
      substrings.push(this.slice(i, j));
    }
  }
  return substrings;
};

// console.log("cat".mySubString());
