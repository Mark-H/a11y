function initA11y() {
	function whosFocused(){	
		var curElement = document.activeElement;
		//localStorage.setItem('curFocus',curElement);
		console.log("currently selected:"+curElement);
		//console.log(curElement.nextSibling.nextSibling.className);
		var nextDude = curElement.nextSibling.nextSibling;
		if(nextDude.className == "modx-subnav"){
			//console.log("bazinga");
			//clear any open subnavs
			clearSubNavOpen();
			
			//force open subnav	
			nextDude.className = "modx-subnav open";
		}	
	}
	
	function clearSubNavOpen(){
		var findSubOpen = document.getElementsByClassName("modx-subnav open");
		var runClearOpen = Array.prototype.filter.call(findSubOpen, function(clearThisUl){
			clearThisUl.className = "modx-subnav";
		});
	}	
	
	//who to watch
	document.getElementById("modx-navbar").addEventListener("keydown", whosFocused, false);
	document.getElementById("modx-navbar").addEventListener("mouseleave", clearSubNavOpen, false);
	//give help an ID by editing line 175 in /controllers/
	document.getElementById("help-link").addEventListener("keydown", clearSubNavOpen, false);	
	document.getElementById("modx-uberbar").addEventListener("keydown", clearSubNavOpen, false);

	
}// eof initA11y