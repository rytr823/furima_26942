const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form"); 
  form.addEventListener("submit", (e) => { 
    e.preventDefault();
  const formResult = document.getElementById("charge-form");
  const formData = new FormData(formResult);
  const card = { 
     number: formData.get("card_address[number]"),              
     cvc: formData.get("card_address[cvc]"),                  
     exp_month: formData.get("card_address[exp_month]"),        
     exp_year: `20${formData.get("card_address[exp_year]")}`,   
   }
   Payjp.createToken(card, (status, response) => {
    if (status === 200) {
      const token = response.id;
      const renderDom = document.getElementById("charge-form"); 
      const tokenObj = `<input value=${token} type="hidden" name='card_address[card_token]'>`; 
      renderDom.insertAdjacentHTML("beforeend", tokenObj);  
      document.getElementById("card_address_number").removeAttribute("name");
      document.getElementById("card_address_cvc").removeAttribute("name");
      document.getElementById("card_address_exp_month").removeAttribute("name");
      document.getElementById("card_address_exp_year").removeAttribute("name");

      document.getElementById("charge-form").submit();
      document.getElementById("charge-form").reset();
      }   
      else{
      }
    });
    });
  };
  window.addEventListener("load", pay);