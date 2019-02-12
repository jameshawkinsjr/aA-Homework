var Animal = require("./animal.js")
    inherit = require("./inherit.js")

function Dog(name) {
    Animal.call(this, name);
}

inherit(Animal, Dog);

Dog.prototype.woof = function() {
    console.log(`woof, I am ${this.name}`);
};

module.exports = Dog;