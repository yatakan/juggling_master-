$(document).on('turbolinks:load', function() {
  var ctx = document.getElementById("myChart").getContext('2d');

  var original = Chart.defaults.global.legend.onClick;
  Chart.defaults.global.legend.onClick = function(e, legendItem) {
    update_caption(legendItem);
    original.call(this, e, legendItem);
  };

  var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: gon.date,
      datasets: [{
        label: gon.nickname + 'さんのキャッチ数',
        backgroundColor: "rgba(153,255,51,1)",
        data: gon.records
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
