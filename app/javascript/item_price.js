window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");
    const taxRate = 0.1;  // 販売手数料率（10%）
    const tax = inputValue * taxRate;
    const profit = inputValue - tax;
    addTaxDom.innerHTML = Math.floor(tax); 
    profitDom.innerHTML = Math.floor(profit);
  });

});
