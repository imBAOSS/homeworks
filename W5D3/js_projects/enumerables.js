Array.prototype.myEach = function (callback) {
  for (i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};
// let arr = new Array(1,2,3,4,5);

// let arr = [1,2,3,4,5];
//
// arr.myEach((el) => {
//   console.log(el);
// })

// [1,2,3,4,5].myEach((el) => {
//   console.log(el);
// })

// Array.prototype.myMap = function (callback) {
//   let mapped = [];
//   this.myEach((el) => {
//     mapped.push( callback(el) );
//   })
// };
//
//
// [1,2,3,4,5].myMap((el) => { console.log(el * el) } );

Array.prototype.myInject = function (accum, callback) {
  this.myEach((el) => { accum = callback(accum, el) });
  console.log(accum);
};

[1,2,3,4,5].myInject(1, (accum, el) => {return accum * el });
