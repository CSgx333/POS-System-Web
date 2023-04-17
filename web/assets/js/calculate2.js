function calculate() {
         var price = document.getElementById("price").value;
         var amount = document.getElementById("amount").value;
         var total_price = 0;
         total_price = price * amount ;
         document.getElementById('total_price').value = total_price;
}

