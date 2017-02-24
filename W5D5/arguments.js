// ============================================== //
// #mySum
// ============================================== //


function argSum() {
  const args = Array.prototype.slice.call(arguments);
  let sum = 0;
  args.forEach((arg) => sum += arg);
  return sum;
}

function restSum(...nums) {
  let sum = 0;
  nums.forEach((num) => sum += num);
  return sum;
}

// ============================================== //
// #myBind -- arguments
// ============================================== //

// console.log(argSum(1,2,3,4,5)); // should be 15
// console.log(restSum(1,2,3,4,5)); // should be 15

// Function.prototype.myCallBind = function (obj) {
//   return (...args) => {
//     return this.apply(obj, args);
//   };
// };

// Function.prototype.myThirdBind = function () {
//   const obj = Array.from(arguments)[0];
//   const bindingArgs = Array.from(arguments).slice(1);
//   console.log(arguments);
//   console.log(bindingArgs);
//   return () => {
//     console.log(arguments);
//     const callingArgs = Array.from(arguments);
//     console.log(callingArgs);
//     return this.apply(obj, bindingArgs.concat(callingArgs));
//   };
// };

// Function.prototype.myThirdBind = function () {
//   const obj = Array.from(arguments)[0];
//   const bindingArgs = Array.from(arguments).slice(1);
//
//   return (args) => {
//     return this.apply(obj, bindingArgs.concat(args));
//   };
// };

Function.prototype.myBind = function(obj) {
  const func = this;
  const bindArgs = Array.from(arguments).slice(1);

  return function () {
    const callArgs = Array.from(arguments);
    return func.apply(obj, bindArgs.concat(callArgs));
  };
};

class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

const markov = new Cat("Markov");
const breakfast = new Cat("Breakfast");

// markov.says("meow", "Ned");
// markov.says.myBind(breakfast, "meow", "Kush")();
// markov.says.myBind(breakfast)("meow", "a tree");
// markov.says.myBind(breakfast, "meow")("Markov");
// const notMarkovSays = markov.says.myBind(breakfast);
// notMarkovSays("meow", "me");

// ============================================== //
// #myBind -- rest
// ============================================== //

Function.prototype.restBind = function (obj, ...bindingArgs) {
  const func = this;
  return function (...callingArgs) {
    func.apply(obj, bindingArgs.concat(callingArgs));
  };
};

// markov.says("meow", "Ned");
// markov.says.restBind(breakfast, "meow", "Kush")();
// markov.says.restBind(breakfast)("meow", "a tree");
// markov.says.restBind(breakfast, "meow")("Markov");
// const notMarkovSays = markov.says.restBind(breakfast);
// notMarkovSays("meow", "me");

// ============================================== //
// #myCurry
// ============================================== //

function curriedSum(numArgs) {
  const numbers = [];
  function _curriedSum(num) {
    numbers.push(num);

    if (numbers.length === numArgs) {
      let numSum = 0;
      numbers.forEach(n => numSum += n);
      return numSum;
    } else {
      return _curriedSum;
    }
  }

  return _curriedSum;
}

const sum = curriedSum(4);
// console.log(sum(5)(30)(20)(1)); // => 56

// ============================================== //
// #Function.prototype.curry -- Apply
// ============================================== //

function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}

Function.prototype.curry = function (numArgs) {
  const func = this;
  const numbers = [];

  function _curry(num) {
    numbers.push(num);
    console.log(numbers);
    if (numbers.length === numArgs) {
      return func.apply(null, numbers);
    } else {
      return _curry;
    }
  }
  return _curry;
};

console.log(sumThree.curry(3)(4)(20)(6)); // == 30

// ============================================== //
// #Function.prototype.curry -- spread
// ============================================== //

Function.prototype.curry = function (numArgs) {
  const func = this;
  const numbers = [];

  function _curry(num) {
    numbers.push(num);
    console.log(numbers);
    if (numbers.length === numArgs) {
      return func(...numbers);
    } else {
      return _curry;
    }
  }
  return _curry;
};

// console.log(sumThree.curry(3)(4)(20)(6)); // == 30
