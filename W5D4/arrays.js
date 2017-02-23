Array.prototype.myUniq = function () {
  let uniq = [];
  for (let i = 0; i < this.length; i++) {
    if (!uniq.includes(this[i])) {
      uniq.push(this[i]);
    }
  }
  console.log(uniq)
}

// [1,2,1,2,3].myUniq();

Array.prototype.myTwoSum = function () {
  let allSum = [];
  for (let i = 0; i < this.length - 1; i++) {
    for (let j = i + 1; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        allSum.push([i,j]);
      }
    }
  }
  console.log(allSum)
}

// [-1, 0, 2, -2, 1].myTwoSum()

Array.prototype.myTranspose = function () {
  const transposed = [];
  for (let i = 0; i < this.length; i++) {
    let row = [];

    for (let j = 0; j < this.length; j++) {
      console.log(1)
      row.push(this[j][i]);
    }

    transposed.push(row);
  }
  console.log(transposed)
}

let rows = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ];
rows.myTranspose()
