(function() {
  window.draw_graph = function() {
    var ctx, myChart;
    ctx = document.getElementById("myChart").getContext('2d');
    return myChart = new Chart(ctx, {
      type: 'pie',
      data: {
        labels: [" おすすめ　　", " おすすめできない"],
        datasets: [
          {
            label: '',
            data: gon.data,
            backgroundColor: ['#FFFF01', 'rgba(255, 255, 255, 0.5)'],
            borderColor: ['#FFFF01', 'rgba(255, 255, 255, 0.5)'],
            borderWidth: 1
          }
        ]
      },
      options: {
        legend: {
          labels: {
            fontColor: 'black',
            fontSize: 18
          }
        }
      }
    });
  };

}).call(this);
