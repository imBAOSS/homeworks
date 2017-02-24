class Clock {
  constructor() {
    let currentTime = new Date();
    this.hours = currentTime.getHours();
    this.minutes = currentTime.getMinutes();
    this.seconds = currentTime.getSeconds();

    setInterval(this._tick.bind(this), 1000);
    // 1. Create a Date object.
    // 2. Store the hours, minutes, and seconds.
    // 3. Call printTime.
    // 4. Schedule the tick at 1 second intervals.
  };

  printTime() {
    let minutes, hours, seconds;

    if (this.minutes < 10) {
      minutes = "0" + this.minutes;
    } else {
      minutes = this.minutes;
    };
    if (this.hours < 10) {
      hours = "0" + this.hours;
    } else {
      hours = this.hours;
    };
    if (this.seconds < 10) {
      seconds = "0" + this.seconds;
    } else {
      seconds = this.seconds;
    };

    console.log(`${hours}:${minutes}:${seconds}`);
    // Format the time in HH:MM:SS
    // Use console.log to print it.
  };

  _tick() {
    if (this.seconds === 59) {
      this.seconds = 0;
      if (this.minutes === 59) {
        this.minutes = 0;
        if (this.hours === 12) {
          this.hours = 1;
        } else {
          this.hours += 1;
        };
      } else {
        this.minutes += 1;
      };
    } else {
      this.seconds += 1;
    };

    this.printTime();
    // 1. Increment the time by one second.
    // 2. Call printTime.
  };
};

// const clock = new Clock();
function addNumbers(sum, numsLeft, completionCallback) {
  if (numsLeft === 0) {
    return completionCallback(sum);
  }

  const readline = require('readline');
  const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
  });

  reader.question("Gimme a number:", (response) => {
    sum += parseInt(response);
    console.log(sum);
    reader.close();
    addNumbers(sum, numsLeft - 1, completionCallback);
  });
}

// addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));

const readline = require("readline");

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// Write this first.
function askIfGreaterThan(el1, el2, callback) {
  reader.question(`Is ${el1} greater than ${el2}?`, (isGreaterThan) =>{
    if (isGreaterThan === "yes") {
      callback(true);
    } else {
      callback(false);
    }
  })
}

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  if (i == arr.length - 1) {
    outerBubbleSortLoop(madeAnySwaps);
    return;
  }

  askIfGreaterThan(arr[i], arr[i + 1], function (isGreaterThan) {
    if (isGreaterThan) {
      let temp = arr[i];
      arr[i] = arr[i + 1];
      arr[i + 1] = temp;
      madeAnySwaps = true;
    };
    innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
  });
}

function absurdBubbleSort(arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps) {
    if (madeAnySwaps) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    } else {
      sortCompletionCallback(arr);
    }
  }
  outerBubbleSortLoop(true);
}

absurdBubbleSort([3, 2, 1], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});





Function.prototype.myBind = function (obj) {
  return () => {
    return this.apply(obj);
  };
}

class Lamp {
  constructor() {
    this.name = "a lamp";
  }
}

const turnOn = function() {
  console.log("Turning on " + this.name);
}

const lamp = new Lamp();

// turnOn(); // should not work the way we want it to

const boundTurnOn = turnOn.bind(lamp);
const myBoundTurnOn = turnOn.myBind(lamp);

// boundTurnOn(); // should say "Turning on a lamp"
// myBoundTurnOn(); // should say "Turning on a lamp"
