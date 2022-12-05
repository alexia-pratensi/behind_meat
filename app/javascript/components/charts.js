import Chart from 'chart.js/auto'
import { counterBoeuf, counterPoulet, counterPorc, counterMouton, counterPoisson } from "/meat_quantity";

export const donut = () => {

  const ctx = document.getElementById('myChart');

  new Chart(ctx, {
    type: 'doughnut',
    data: {
      // via le controller de pages et donc vue dashboard, récupérer infos conso de la journée
      labels: ['Boeuf', 'Poulet', 'Porc', 'Mouton', 'Poisson'],
      datasets: [{
        label: '%',
        data: [counterBoeuf, counterPoulet, counterPorc, counterMouton, counterPoisson],
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
