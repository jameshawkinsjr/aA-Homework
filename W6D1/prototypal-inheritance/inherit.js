var inherit = function(parent, child){
    var Surrogate = function(){};
    Surrogate.prototype = parent.prototype;

    child.prototype = new Surrogate();
    child.prototype.constructor = child;
};

module.exports = inherit;