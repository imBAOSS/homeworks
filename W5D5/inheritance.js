// class Surrogate {
//   constructor() {
//
//   }
// }

Function.prototype.inherits = function (parentClass) {
  function Surrogate() {}

  Surrogate.prototype = parentClass.prototype;
  this.prototype =  new Surrogate();
  this.prototype.constructor = this;
};

class Animal {
  constructor(name) {
    this.name = name;
  }

  eat() {
    console.log("I'm eating");
  }
}

class Dog {
  constructor(name) {
    this.name = name;
  }

  woof() {
    console.log("Woof!");
  }
}

class Cat {
  constructor(name) {
    this.name = name;
  }

  meow() {
    console.log("Meow!");
  }
}

Dog.inherits(Animal);
Cat.inherits(Animal);
