var x = [];
var y = [];
var z = [];
x = document.getElementsByClassName("enlarge-link");
for(var i = 0; i < x.length; i++)
{
	y[i] = x[i].firstElementChild.getAttribute("src");
	if(y[i] != null)
	{
		y[i] = y[i].replace("?thumbnail=true","");
		y[i] = "<p>" + "wget --no-check-certificate " + "https://shop.prestigeportraits.com" + y[i] + "</p>";
		z.push(y[i]);
	}
}
document.body.innerHTML = "";
for(var i = 0; i < z.length; i++)
{
	document.body.innerHTML += z[i];
}