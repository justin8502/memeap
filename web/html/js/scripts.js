$(document).ready(function() {
	let index = 1
	const limit = 7
	//alert(index);
	$(".window").click(function(e) {
		let newurl = `url(img/img_${index}.jpg)`
		//alert(newurl)
		$('.window').css('backgroundImage',newurl);
		index = (index + 1) % limit 
	});
});