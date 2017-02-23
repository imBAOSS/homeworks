function range(start, end) {
  if (end < start) {
    return [];
  }

  let result = [start];
  return result.concat(range(start + 1, end));
}

// console.log(range(1,10));

function iterSum(arr) {
  let sum = 0
  // for (i = 0; i < arr.length; i++) {
  //   sum += arr[i];
  // }
  arr.forEach((el) => { sum += el })
  return sum;
}

// console.log(iterSum([1,2,3,4,5]));

function recSum(arr) {
  if (arr.length === 1) {
    return arr[0];
  }

  return arr[0] + recSum(arr.slice(1));
}

// console.log(recSum([1,2,3,4,5]));

function recExp(b, n) {
  if (n === 0) {
    return 1;
  }

  return b * recExp(b, n - 1);
}

// console.log(recExp(2, 4));

function recFib(n) {
  if (n === 2) {
    return [1, 1];
  }

  let prevFib = recFib(n - 1);
  return prevFib.concat([prevFib[prevFib.length - 1] + prevFib[prevFib.length - 2]]);
}

// console.log(recFib(7));

function recBSearch(arr, target) {
  let mid = Math.floor(arr.length / 2);

  if (arr.length === 0) {
    return null;
  } else if (arr[mid] === target) {
    return mid;
  }

  if (target < arr[mid]) {
    return recBSearch(arr.slice(0,mid), target);
  } else {
    let pos = recBSearch(arr.slice(mid + 1), target);
    if (pos === null) {
      return pos;
    } else {
      return mid + 1 + pos;
    }
  }

  // if (arr.length === 0) {
  //   return null;
  // }
  //
  // let mid = Math.floor(arr.length / 2);
  //
  // if (target === arr[mid]) {
  //   return mid;
  // } else if (target < arr[mid]) {
  //   return recBSearch(arr.slice(0,mid), target);
  // } else{
  //   return recBSearch(arr.slice(mid + 1), target) + mid + 1
  // }
}

// console.log(recBSearch([ 1, 1, 2, 3, 5, 8, 13 ], 8));
// console.log(recBSearch([1, 2, 3, 4, 5, 6], 0));
function merge(left, right) {
  let result = [];
  while (left.length > 0 && right.length > 0) {
    if (left[0] < right[0]) {
      result.push(left[0]);
      left = left.slice(1);
    } else {
      result.push(right[0]);
      right = right.slice(1);
    }
  }
  return result.concat(left.concat(right));
}

function recMergeSort(array) {
  if (array.length <= 1) {
    return array;
  }

  let mid = Math.floor(array.length / 2);
  let left = recMergeSort(array.slice(0, mid));
  let right = recMergeSort(array.slice(mid));

  return merge(left, right);
}

// console.log(recMergeSort( [2, 8, 4, 9, 5, 2, 5, 7, 55, 3] ) );

function recSubSet(array) {
  if (array.length < 1) {
    return [array];
  }

  let last = array[array.length - 1];

  let subsets = recSubSet(array.slice(0, array.length - 1));

  let result = subsets;
  subsets.forEach((subset) => {
    result.push(subset.concat(last));
  });

  return result;
}

// console.log(recSubSet([1,2,3,4]));
