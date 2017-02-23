function madLib(str1, str2, str3) {
  var str1Upper = str1.toUpperCase();
  var str2Upper = str2.toUpperCase();
  var str3Upper = str3.toUpperCase();

  console.log(`We shall ${str1Upper} the ${str2Upper} ${str3Upper}.`);
}

function isSubstring(searchString, subString) {
  if (searchString.includes(subString)) {
    return true;
  } else {
    return false;
  }
}

function fizzBuzz(array) {
  var fbArray = new Array ();

  for (let i = 0; i < array.length; i++){
    if ( array[i] % 3 && array[i] % 5) {
      continue;
    } else if ( array[i] % 3 || array[i] % 5 ) {
      fbArray.push(array[i]);
    }
  }

  return fbArray;
}
