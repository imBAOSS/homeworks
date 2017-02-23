const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// function teaAndBiscuits() {
//   reader.question("Would you like some tea?", function (res1) {
//     console.log(`You replied with ${res1}.`);
//     reader.question("Would you like some biscuits?", function (res2) {
//       console.log(`You replied with ${res2}.`);
//
//       const first = ( res1 === "yes" ? "do" : "don't");
//       const second = ( res2 === "yes" ? "do" : "don't");
//       console.log(`So that's a ${res1} for tea and a ${res2} for coffee`);
//
//       reader.close();
//     });
//   });
// }

function teaAndBiscuits () {
  reader.question('Would you like some tea?', function (res) {
    console.log(`You replied ${res}.`);
    reader.question('Would you like some biscuits?', function (res2) {
      console.log(`You replied ${res2}.`);

      const first = (res === 'yes') ? 'do' : 'don\'t';
      const second = (res2 === 'yes') ? 'do' : 'don\'t';

      console.log(`So you ${first} want tea and you ${second} want biscuits.`);
      reader.close();
    });
  });
}
