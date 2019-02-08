// window.setTimeout( function() {
//     alert('HAMMERTIME');
// }, 5000);

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits(callback) {
  reader.question("Woudl you like some tea? ", function (res) {
      const first = res;
      console.log(`You replied ${res}.`);
    reader.question("Would you like some biscuits? ", function (res) {
      const second = res;
      console.log(`You replied ${res}.`);

      callback(first, second);
    });
  });
};

teaAndBiscuits(function (first, second) {
    const firstRes = (first === 'yes') ? 'do' : 'don\'t';
    const secondRes = (second === 'yes') ? 'do' : 'don\'t';
    console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits.`);
    reader.close();
});