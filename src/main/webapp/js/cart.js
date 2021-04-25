/**
 * 
 */





let productList = [];
function addToCart(id, name, price, discountPrice) {


	let cart = localStorage.getItem("cartList");
	if (cart == null) {

		product = {
			pid: id,
			pname: name,
			pquantity: 1,
			pprice: price,
			dprice: discountPrice
		}

		productList.push(product);
		let str = JSON.stringify(productList);

		localStorage.setItem("cartList", str);

	}
	else {
		let newcart = JSON.parse(cart);
		let addedProduct = newcart.find((pro) => pro.pid == id);



		if (addedProduct) {

			newQuantity = addedProduct.pquantity + 1

			newcart.map((pro) => {
				if (addedProduct.pid == pro.pid) {
					pro.pquantity = newQuantity;
				}
			})

			localStorage.setItem("cartList", JSON.stringify(newcart));


		}
		else {
			product = {
				pid: id,
				pname: name,
				pquantity: 1,
				pprice: price,
				dprice: discountPrice
			}

			newcart.push(product);
			let str = JSON.stringify(newcart);

			localStorage.setItem("cartList", str);
		}



	}
	
	let msg=document.getElementById("addedToCart");
	msg.innerHTML=`
	
	<div class="alert alert-success alert-dismissible fade show" role="alert">
  <strong>Your product added to cart successfully....</strong> 
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
	`;
	
	setTimeout(function(){
		msg.innerHTML='';
	},5000)

	


}





function showCart() {


	let table = document.querySelector(".table-container");
		let total = 0;
	let html = `
				<tr>
								<th scope="col">Product Name</th>
								<th scope="col">Price ( 1 kg )</th>
								<th scope="col">Quantity ( kg )</th>
								<th scope="col">Total Price</th>
								<th scope="col"></th>
							</tr>
	`;

	let cart = localStorage.getItem("cartList");
	cart = JSON.parse(cart);


	cart.forEach(function(ele) {
		
		html += `
		<tr>
		<input type="hidden" value="${ele.pid}" name="">
		<td>${ele.pname}</td>
		<td>${ele.pprice}</td>
		<td>${ele.pquantity}</td>
		<td>${ele.pquantity * ele.dprice}</td>
		<td><button type="button" class="btn btn-outline-danger" onclick="deleteProduct(${ele.pid})" style="height:30px;padding:2px;width:100%">Remove</button></td>
		</tr>
		
		`;
		total = (ele.pquantity * ele.dprice) + total;


	})
	
	html=html+`<tr>
			<th colspan="3"></th>
			<th>Total : ${total}</th>
		</tr>`;
	
	
	
	table.innerHTML=html;
	
	


}



function deleteProduct(id) {

	let cart = localStorage.getItem("cartList");

	cart = JSON.parse(cart);
	let productIndex = cart.findIndex((pro) => pro.pid == id)

	cart.splice(productIndex, 1);

	localStorage.setItem("cartList", JSON.stringify(cart));

	showCart();




}



















