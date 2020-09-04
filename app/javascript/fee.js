window.addEventListener('load',function(){
  const item_price = document.getElementById('item-price')
  const fee_late = 0.1;

  item_price.addEventListener('keyup',(e) => {
    let item_fee = Math.floor( item_price.value * fee_late)
    let item_profit = Math.floor( item_price.value - item_fee)
    document.getElementById('add-tax-price').innerHTML = item_fee
    document.getElementById('profit').innerHTML = item_profit
  });
})