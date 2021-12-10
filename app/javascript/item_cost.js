window.addEventListener('load', () => {
  const costInput = document.getElementById("item-price");
  costInput.addEventListener("input", () => {
    const inputValue = costInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(costInput.value * 0.1);
    addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = Math.floor(costInput.value) + Math.floor(costInput.value * 0.1)
  })
 })
