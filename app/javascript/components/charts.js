import Chart from 'chart.js/auto'

export const donut = () => {

  const ctx = document.getElementById('myChart');
  const totalBeef = parseInt(ctx.dataset.beef, 10)
  const totalChicken = parseInt(ctx.dataset.chicken, 10)
  const totalPork = parseInt(ctx.dataset.pork, 10)
  const totalSheep = parseInt(ctx.dataset.sheep, 10)
  const totalFish = parseInt(ctx.dataset.fish, 10)

  new Chart(ctx, {
    type: 'doughnut',
    data: {
      // via le controller de pages et donc vue dashboard, récupérer infos conso de la journée
      labels: ['Boeuf', 'Poulet', 'Porc', 'Mouton', 'Poisson'],
      datasets: [{
        label: '%',
        data: [totalBeef, totalChicken, totalPork, totalSheep, totalFish],
        borderWidth: 1,
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
