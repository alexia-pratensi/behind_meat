import axios from 'axios'

export const meatQuantity = () => {
  let incrementVache = document.getElementById("btn_increment_vache");
  let decrementVache = document.getElementById("btn_decrement_vache");
  let counterVache = document.getElementById("quantity_vache");

  let numVache = 0;

  incrementVache.onclick = () => {
    let numVache = parseInt(counterVache.innerHTML);
    counterVache.innerHTML = numVache + 50;
  }

  decrementVache.onclick = () => {
    const numVache = parseInt(counterVache.innerHTML);
    counterVache.innerHTML = numVache - 50;
  }

  localStorage.setItem("vacheQuantity", numVache);
 // console.log(localStorage);
  console.log(numVache);


  //JS pour la card cochon
  let incrementCochon = document.getElementById("btn_increment_cochon");
  let decrementCochon = document.getElementById("btn_decrement_cochon");
  let counterCochon = document.getElementById("quantity_cochon");

  let numCochon = 0;

  incrementCochon.onclick = () => {
    let numCochon = parseInt(counterCochon.innerHTML);
    counterCochon.innerHTML = numCochon + 50;
  }

  decrementCochon.onclick = () => {
    const numCochon = parseInt(counterCochon.innerHTML);
    counterCochon.innerHTML = numCochon - 50;
  }

  let cochonQuantity = localStorage.setItem("cochonQuantity", numCochon)
  console.log(numCochon)
  console.log('cochon terminé!')

  //JS pour la card poulet
  let incrementPoulet = document.getElementById("btn_increment_poulet");
  let decrementPoulet = document.getElementById("btn_decrement_poulet");
  let counterPoulet = document.getElementById("quantity_poulet");

  let numPoulet = 0;

  incrementPoulet.onclick = () => {
    let numPoulet = parseInt(counterPoulet.innerHTML);
    counterPoulet.innerHTML = numPoulet + 50;
  }

  decrementPoulet.onclick = () => {
    const numPoulet = parseInt(counterPoulet.innerHTML);
    counterPoulet.innerHTML = numPoulet - 50;
  }

  let pouletQuantity = localStorage.setItem("cochonQuantity", numPoulet)
  console.log(numPoulet)
  console.log('poulet terminé!')

   //JS pour la card mouton
  let incrementMouton = document.getElementById("btn_increment_mouton");
  let decrementMouton = document.getElementById("btn_decrement_mouton");
  let counterMouton = document.getElementById("quantity_mouton");

  let numMouton = 0;

  incrementMouton.onclick = () => {
    let numMouton = parseInt(counterMouton.innerHTML);
    counterMouton.innerHTML = numMouton + 50;
  }

  decrementMouton.onclick = () => {
    const numMouton = parseInt(counterMouton.innerHTML);
    counterMouton.innerHTML = numMouton - 50;
  }

  let moutonQuantity = localStorage.setItem("moutonQuantity", numMouton)
  console.log('mouton trené!')

   //JS pour la card poisson
   let incrementPoisson = document.getElementById("btn_increment_poisson");
   let decrementPoisson = document.getElementById("btn_decrement_poisson");
   let counterPoisson  = document.getElementById("quantity_poisson");

   let numPoisson  = 0;

   incrementPoisson .onclick = () => {
     let numPoisson  = parseInt(counterPoisson.innerHTML);
     counterPoisson.innerHTML = numPoisson + 50;
   }

   decrementPoisson .onclick = () => {
     const numPoisson  = parseInt(counterPoisson.innerHTML);
     counterPoisson.innerHTML = numPoisson  - 50;
   }

   let PoissonQuantity = localStorage.setItem("poissonQuantity", numPoisson )
   console.log('poisson sauvxsxzé!')

   // pour la card vege
   //?

  //pour envoyer les inputs au controller de day
    // pour calcul pour chaque type de viande
  const submitButton = document.querySelector('#submit-button')
  submitButton.addEventListener('click', () => {
    const csrf = document.getElementsByName("csrf-token")[0].content
    let dateQuantity = document.getElementById('date-quantity')
    axios.post('/days', {
      vache: counterVache.textContent,
      poulet: counterPoulet.textContent,
      cochon: counterCochon.textContent,
      mouton: counterMouton.textContent,
      poisson: counterPoisson.textContent,

      day: {date: dateQuantity}
    }, {
      headers: {
        'X-CSRF-Token': csrf
      }
    })
    .then(function (response) {
      window.location.assign("/dashboard");
    })
    .catch(function (error) {
      console.log(error);
    })
  });

    // calcul pour card vegetarien
    const cardVegetarien = document.querySelector('#card-vegetarien')
    cardVegetarien.addEventListener('click', () => {
    const csrf = document.getElementsByName("csrf-token")[0].content
    let dateQuantity = document.getElementById('date-quantity')
    axios.post('/days', {
      vache: 0,
      poulet: 0,
      cochon: 0,
      mouton: 0,
      poisson: 0,

      day: {date: dateQuantity}
    }, {
      headers: {
        'X-CSRF-Token': csrf
      }
    })

    .then(function (response) {
      console.log(response);
    })
    .catch(function (error) {
      console.log(error);
    })
  });

}
