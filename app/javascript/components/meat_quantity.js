export const meatQuantity = () => {
  const checkbox = document.getElementById('checkbox-quantity"');
  const increment = document.getElementById('quantity-less');
  const decrement = document.getElementById('quantity-more');
  const input = document.getElementById('input-quantity');

  checkbox.addEventListener("change", function(checkbox) {
    console.log('hello');

    if (this.checked === false) {
      increment.disabled = true;
      decrement.disabled = true;
    } else {
      increment.disabled = false;
      decrement.disabled = false;
    }
  });

  increment.onclick = () => {
    const num = parseInt(input.innerHTML);
    input.innerHTML = num + 1;
  }

  decrement.onclick = () => {
     const num = parseInt(input.innerHTML);
    input.innerHTML = num - 1;
  }

}
