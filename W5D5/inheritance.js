Function.prototype.inherits = function (parentClass) {
  function Surrogate() {}

  Surrogate.prototype = parentClass.prototype;
  this.prototype =  new Surrogate();
  this.prototype.constructor = this;
};

function Animal(name) {
  this.name = name;
}

Animal.prototype.eat = function () {
  console.log("I'm eating");
};


function Dog(name) {
  this.name = name;
}

Dog.prototype.woof = function () {
  console.log("Woof");
};

function Cat(name) {
  this.name = name;
}

Cat.prototype.meow = function () {
  console.log("Meow");
};

Dog.inherits(Animal);
Cat.inherits(Animal);
