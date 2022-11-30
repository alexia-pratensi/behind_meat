import Chart from 'chart.js/auto'

export const donut = () => {

  const ctx = document.getElementById('myChart');

  new Chart(ctx, {
    type: 'doughnut',
    data: {
      // via le controller de pages et donc vue dashboard, récupérer infos conso de la journée
      labels: ['Beef', 'Chicken', 'Pork', 'Sheep', 'Fish'],
      datasets: [{
        label: '%',
        data: [12, 19, 2, 8, 5],
        borderWidth: 0,
        backgroundColor: ["#ED4D6E","#F07575","#F28E7B", "#F5AD80", "#67ACAC"]
      }],
    },
    options: {
      responsive: true,
      plugins: {
        legend: {
          position: 'top',
        },
        title: {
          display: true,
          // text: "Ma consommation de viande aujourd'hui"
        }
      },
    },
  });
}
