export const animalsDeath = () => {
  const counter = document.querySelector('.compteur-animals')
  var counts = [ 0, 0, 0, 0, 0, 0, 0, 0 ];
  var rate = [ 0, 0, 0, 0, 0, 0, 0, 0 ];
  if (counter) {
    // Global variables: ___________________________________________________________________
    console.log('compteur');
    // Functions: __________________________________________________________________________
    function StartKillCounter() {
      var millions = [ 90000, 45895, 2262, 1244, 691, 533, 515, 292 ];
      var perSecond = 8;
      for (var i = 0; i < counts.length; ++i)
        rate[i] = millions[i] * 1000000 / 365 / 24 / 60 / 60 / perSecond;
      interval = setInterval(NewCounts, 1000 / perSecond);
    }

    function NewCounts() {
      var num, thous, str;
      for (var i = 0; i < counts.length; ++i) {
        counts[i] += rate[i];
        num = Math.round(counts[i]);
        str = "";
        while (num > 1000) {
          thous = num % 1000;
          if (thous < 10)
            thous = "00" + thous;
          else if (thous < 100)
            thous = "0" + thous;
          str = "," + thous + str;
          num = Math.floor(num / 1000);
        }
        str = num + str;
        document.getElementById("count" + i).innerHTML = str;
      }
    }
    StartKillCounter()
  }
}
