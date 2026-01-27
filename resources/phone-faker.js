
function () {
  function generatePhone() {
    var num = Math.floor(9000000000 + Math.random() * 1000000000);
    return num.toString();
  }
  return generatePhone();
}