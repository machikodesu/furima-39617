const item_price = () => {
  const priceInput = document.getElementById("item-price");
  if (!priceInput) return nil;
  priceInput.addEventListener("input", () => {
        const inputValue = priceInput.value;
        const addTaxDom = document.getElementById("add-tax-price");
        addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1 );
        const addProfitDom = document.getElementById("profit");
        addProfitDom.innerHTML = Math.floor(priceInput.value - Math.floor(priceInput.value * 0.1 ))
 })
};

window.addEventListener("turbo:load", item_price);