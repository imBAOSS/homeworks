window.setTimeout(function() {
    alert('HAMMERTIME');
}, 5000);

function hammerTime(time) {
  window.setTimeout(function() {
    alert(`${time} is hammertime!`);
  }, time);
}
