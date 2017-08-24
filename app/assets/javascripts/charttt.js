$(document).on('turbolinks:load', function() {
  var ctx = document.getElementById("myChart").getContext('2d');

  var original = Chart.defaults.global.legend.onClick;
  Chart.defaults.global.legend.onClick = function(e, legendItem) {
    update_caption(legendItem);
    original.call(this, e, legendItem);
  };

  var numbers = []
  for(var i = 0; i < 30; i++){
    numbers.push(i + "日")
  }

  var quantity = []
  for(var i = 0; i < 30; i++){
    num = String(Math.floor( Math.random() * 100 ) + i * 20)
    quantity.push(num)
  }

  var quantity2 = []
  for(var i = 0; i < 30; i++){
    num = String(Math.floor( Math.random() * 100 ) + i * 25)
    quantity2.push(num)
  }

  console.log(numbers)
  console.log(quantity)

  var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: gon.date,
      datasets: [{
        label: '三浦さんのキャッチ数',
        backgroundColor: "rgba(153,255,51,1)",
        data: gon.records
      },{
        label: 'あなたのライバル',
        backgroundColor: "rgba(255,153,0,1)",
        data: quantity2
      }]
    }
  });

  var labels = {
    "apples": true,
    "oranges": true
  };

  var caption = document.getElementById("caption");

  var update_caption = function(legend) {
    labels[legend.text] = legend.hidden;

    var selected = Object.keys(labels).filter(function(key) {
      return labels[key];
    });

    var text = selected.length ? selected.join(" & ") : "nothing";

    caption.innerHTML = "The chart is displaying " + text;
  };
});
