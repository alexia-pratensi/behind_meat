import axios from 'axios'

export const meatQuantity = () => {
  let incrementBoeuf = document.getElementById("btn_increment_boeuf");
  if (incrementBoeuf) {
    console.log('coucou');

    let decrementBoeuf = document.getElementById("btn_decrement_boeuf");
    let counterBoeuf = document.getElementById("quantity_boeuf");

    let numBoeuf = 0;

    incrementBoeuf.addEventListener('click', () => {
      let numBoeuf = parseInt(counterBoeuf.innerHTML);
      counterBoeuf.innerHTML = numBoeuf + 50;
    })

    decrementBoeuf.onclick = () => {
      const numBoeuf = parseInt(counterBoeuf.innerHTML);
      counterBoeuf.innerHTML = numBoeuf - 50;
    }



    //JS pour la card Porc
    let incrementPorc = document.getElementById("btn_increment_porc");
    let decrementPorc = document.getElementById("btn_decrement_porc");
    let counterPorc = document.getElementById("quantity_porc");

    let numPorc = 0;

    incrementPorc.onclick = () => {
      let numPorc = parseInt(counterPorc.innerHTML);
      counterPorc.innerHTML = numPorc + 50;
    }

    decrementPorc.onclick = () => {
      const numPorc = parseInt(counterPorc.innerHTML);
      counterPorc.innerHTML = numPorc - 50;
    }

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

    // pour la card vege
    //?

    //pour envoyer les inputs au controller de day
    // pour calcul pour chaque type de viande
    const submitButton = document.querySelector('#submit-button')
    submitButton.addEventListener('click', () => {
      const csrf = document.getElementsByName("csrf-token")[0].content
      let dateQuantity = document.getElementById('day_date')
      axios.post('/days', {
        boeuf: counterBoeuf.textContent,
        poulet: counterPoulet.textContent,
        porc: counterPorc.textContent,
        mouton: counterMouton.textContent,
        poisson: counterPoisson.textContent,
        day: {date: dateQuantity.value}
      }, {
        headers: {
          'X-CSRF-Token': csrf
        }
    })
    .then(function (response) {
      window.location.assign(`/days/${response.data.id}`);
      console.log('hello');
    })
    .catch(function (error) {
      console.log(error);
    })
  });

  // calcul pour card vegetarien
  const vegetarien = document.querySelector('#card-vegetarien')
  vegetarien.addEventListener('click', () => {
    counterPoisson.innerHTML = 0;
    counterPorc.innerHTML = 0;
    counterPoulet.innerHTML = 0;
    counterBoeuf.innerHTML = 0;
    counterMouton.innerHTML = 0;

    const csrf = document.getElementsByName("csrf-token")[0].content
    let dateQuantity = document.getElementById('day_date')
    axios.post('/days', {
      boeuf: 0,
      poulet: 0,
      porc: 0,
      mouton: 0,
      poisson: 0,

      day: {date: dateQuantity.value}
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
}
