window.onload=function(){
	var oNav=document.getElementsByTagName('ul')[0];
	var aA=oNav.getElementsByTagName('a');
	for(var i=0; i<aA.length; i++){
		aA[i].onmouseover=function(){
			// if(this.className!="on"){
			// 	clearInterval(this.timer);
			// 	var This=this;
			// 	This.time=setInterval(function(){
			// 		This.style.width=This.offsetWidth+8+"px";
			// 		if(This.offsetWidth>=120)
			// 		clearInterval(This.time);
			// 	},30)
			// }
			var This = this;
			This.style.cssText = "background-color:red;color:White";
			document.getElementById("test").innerHTML="鼠标进入";
		}
		aA[i].onmouseout=function(){

			document.getElementById("test").innerHTML="鼠标离开";
			// if(this.className!="on"){
			// 	clearInterval(this.time);
			// 	var This=this;
			// 	this.time=setInterval(function(){
			// 		This.style.width=This.offsetWidth-8+"px";
			// 		if(This.offsetWidth<=80){
			// 			This.style.width='80px';
			// 			clearInterval(This.time);
			// 		}
			// 	},30)
			// }
			var This = this;
			This.style.cssText = "background-color:gray; color:red";

		}
	}
}