function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';  
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';  
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';  
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';  
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    // let x = 'in block';  
    console.log(x);
  }
  // let x = 'out of block again';
  console.log(x);
}

console.log("1")
mysteryScoping1()
console.log("2")
mysteryScoping2()
// console.log("3")
// mysteryScoping3()
console.log("4")
mysteryScoping4()
console.log("5")
mysteryScoping5()


function madLib(a, b, c) {
  console.log(`We shall ${ a.toUpperCase() } the ${ b.toUpperCase() } ${ c.toUpperCase() }`);
};

madLib('make', 'best', 'guac');


function isSubstring(string, substring){
  console.log(string.includes(substring))
}

isSubstring("time to program", "time")
isSubstring("Jump for joy", "joys")


function fizzBuzz(array){
  let new_array = []
  array.forEach(function(element){
    if ( !(element % 3 === 0 && element % 5 ===0) && (element % 3 === 0 || element % 5 === 0)) {
      new_array.push(element);
    };
  });
  return new_array;
}

console.log(fizzBuzz([1,2,3,4,5,6,7,8,9,10,11,12,13,1,15,16,17,18,19]));



function isPrime(num){
  for (let i = 2; i < num; i++){
   if (num % i === 0) {
    return false;  
   }
  }
  return true
};


console.log(isPrime(4));

function sumOfNPrimes(n) {
  let sum = 0;
  let count = 0;
  let i = 1;
  if (n === 0){
    return 0;
  };
  while (count < n){
    i++
    if (isPrime(i)) {
      sum += i;
      count++;
    };
  };
  return sum
};
  
console.log(sumOfNPrimes(0));
console.log(sumOfNPrimes(1));
console.log(sumOfNPrimes(4));