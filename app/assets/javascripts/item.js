$(function() {
  $('.price-input').on('input', function(){
    let price = $('.price-input').val();
    let sales_profit = Math.round(price * 0.9)
    let sales_commission = (price - sales_profit)
    $('.sales_commission').html(sales_commission)
    $('.sales_profit').html(sales_profit)
    $('#add-tax-price').val(sales_commission)
    $('#profit').val(sales_profit)
  })
})