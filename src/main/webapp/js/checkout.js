/**
 * 
 */

function show() {

	let table = document.querySelector(".table-container2");
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
		<td>${ele.pname}</td>
		<td>${ele.pprice}</td>
		<td>${ele.pquantity}</td>
		<td>${ele.pquantity * ele.dprice}</td>
		<td><button type="button" class="btn btn-outline-danger" onclick="deleteProduct(${ele.pid})" style="height:30px;padding:2px;width:100%">Remove</button></td>
		</tr>
		
		`;
		total = (ele.pquantity * ele.dprice) + total;


	})

	html = html + `<tr>
			<th colspan="3"></th>
			<th>Total : ${total}</th>
		</tr>`;



	table.innerHTML = html;

}

show();


function deleteProduct(id) {

	let cart = localStorage.getItem("cartList");

	cart = JSON.parse(cart);
	let productIndex = cart.findIndex((pro) => pro.pid == id)

	cart.splice(productIndex, 1);

	localStorage.setItem("cartList", JSON.stringify(cart));

	show();




}