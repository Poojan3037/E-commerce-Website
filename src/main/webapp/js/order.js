/**
 * 
 */

function order(id, name, email, phone) {

	let add = document.getElementById("userAdd").value;
	console.log(id, name, email, phone, add);

	let cart = localStorage.getItem("cartList");
	cart = JSON.parse(cart);

	let productId;
	let productName;
	let productQuantity;
	let productPrice;
	let productTotal;

	cart.forEach(function(e) {
		if (productId == undefined) {
			productId = `${e.pid}`;
		}
		else {
			productId = `${productId},${e.pid}`;
		}

		if (productName == undefined) {
			productName = `${e.pname}`;
		}
		else {
			productName = `${productName},${e.pname}`;
		}


		if (productQuantity == undefined) {
			productQuantity = e.pquantity;
		}
		else {
			productQuantity = `${productQuantity},${e.pquantity}`
		}

		if (productPrice == undefined) {
			productPrice = e.dprice;
		}
		else {
			productPrice = `${productPrice},${e.dprice}`
		}

		if (productTotal == undefined) {
			productTotal = parseInt(e.dprice * e.pquantity);
		}
		else {
			productTotal = productTotal + parseInt(e.dprice * e.pquantity);
		}
	})

	console.log(productId);
	console.log(productName);
	console.log(productQuantity);
	console.log(productPrice);
	console.log(productTotal)

	let html = `
		<form action="OrderServelet" method="post"  id="orderFrom">
		<input type="hidden" value="${productId}" name="pid">
		<input type="hidden" value="${productName}" name="pname">
		<input type="hidden" value="${productQuantity}" name="pquantity">
		<input type="hidden" value="${productPrice}" name="dprice">
		<input type="hidden" value="${productTotal}" name="total">
		<input type="hidden" value="${id}" name="id">
		<input type="hidden" value="${name}" name="name">
		<input type="hidden" value="${email}" name="email">
		<input type="hidden" value="${phone}" name="phone">
		<input type="hidden" value="${add}" name="add">
		<input type="submit">
		</form>
		`;

	let od = document.getElementById("od");
	od.innerHTML = html;
	document.getElementById("orderFrom").submit();
	
	
	localStorage.clear();




}


