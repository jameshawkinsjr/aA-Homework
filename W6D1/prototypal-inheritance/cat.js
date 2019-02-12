var Animal = require("./animal.js")
    inherit = require("./inherit.js")

function Cat(name) {
    Animal.call(this, name);
}
inherit(Animal, Cat);

Cat.prototype.meow = function() {
    console.log(`meow, I am ${this.name}`)
};


module.exports = Cat;