Function.prototype.inherits = function (parentClass) {
  // function Surrogate() {}
  //
  // Surrogate.prototype = parentClass.prototype;
  // this.prototype =  new Surrogate();
  // this.prototype.constructor = this;
  this.prototype = Object.create(parentClass.prototype);
};

function Animal(name) {
  this.name = name;
}

Animal.prototype.eat = function () {
  console.log("I'm eating");
};

function Dog(name) {
  // this.name = name;
  Animal.call(this, name);
}
Dog.inherits(Animal);

Dog.prototype.woof = function () {
  console.log("Woof");
};

function Cat(name) {
  // this.name = name;
  Animal.call(this, name);
}

Cat.inherits(Animal);

Cat.prototype.meow = function () {
  console.log("Meow");
};
