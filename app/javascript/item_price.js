window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price")
    addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1);
    const profitValue = document.getElementById("profit")
    profitValue.innerHTML = Math.floor(priceInput.value * 0.9);
  })
});
