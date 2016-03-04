// this is some messy Javascript, mang
// dear JS gods, forgive me, for I have sinned

var console_state = false

function tilde_console(e) {
	var x = event.which || event.keyCode;
	if (x == "96") {
		if (console_state == false) {
			load_console();
			console_state = true;
		}
		else {
			document.getElementById("faux_console").remove();
			console_state = false;
		}
	}
}

function load_console() {

	var che = document.createElement('div');
	che.setAttribute('style', 'font-family: "Arial"; -webkit-font-smoothing: none; color: white; line-height: 1; font-size: 13px;');
	che.innerHTML = 'console';

	var cl = document.createElement('div');
	cl.setAttribute('id','console_log');
	cl.setAttribute('style', 'height: 230px; line-height: 1.1; margin: 10px auto; padding: 4px; -webkit-font-smoothing: none; background-color: rgba(0,0,0,.5); font-family: monospace; color: white; font-size: 13px; overflow: scroll; box-shadow: 1px 1px 0px rgba(255,255,255,0.5), 1px 1px 0px rgba(0,0,0,.25) inset;');

	var cf = document.createElement('input');
	cf.setAttribute('type','text');
	cf.setAttribute('id','console_field');
	cf.setAttribute('style', '-webkit-font-smoothing: none; background-color: rgba(0,0,0,.5); font-family: monospace; color: white; font-size: 13px; overflow: scroll; border: none; box-shadow: 1px 1px 0px rgba(255,255,255,0.5), 1px 1px 0px rgba(0,0,0,.25) inset; outline: none; width: 220px; height: 20px; vertical-align: top;');

	var cfs = document.createElement('input');
	cfs.setAttribute('type','submit');
	cfs.setAttribute('value','Submit   ');
	cfs.setAttribute('id','console_field_send');
	cfs.setAttribute('style', '-webkit-font-smoothing: none; -webkit-appearance: none; font-family: "Arial"; color: white; font-size: 13px; height: 23px; background-color: transparent; border-width: 1px; border-top-color: rgba(255,255,255,0.5); border-left-color: rgba(255,255,255,0.5); border-bottom-color: rgba(0,0,0,.25); border-right-color: rgba(0,0,0,.25); margin-left: 10px; vertical-align: top;');
	cfs.setAttribute('onclick','logger(event);')

	var c = document.createElement('div');
	c.setAttribute('id','faux_console');
	c.setAttribute('style','position: fixed; top: 10px; left: 10px; width: 300px; height: 300px; background-color: rgba(50,70,36,.75); border-radius: 6px; padding: 10px; box-shadow: 1px 1px 0 rgba(255,255,255,.5) inset, -1px -1px 0 rgba(0,0,0,.25) inset;');

	c.appendChild(che);
	c.appendChild(cl);
	c.appendChild(cf);
	c.appendChild(cfs);

	document.body.appendChild(c);
}

function logger() {
	var value = document.getElementById('console_field').value;
	document.getElementById('console_field').value = "";
	document.getElementById('console_log').innerHTML += value + "</br>"

	if (value === "sv_cheats 1") {
		document.getElementById('console_log').innerHTML += "Cheat mode enabled" + "</br>"
	}
}

Element.prototype.remove = function() {
    this.parentElement.removeChild(this);
}
NodeList.prototype.remove = HTMLCollection.prototype.remove = function() {
    for(var i = this.length - 1; i >= 0; i--) {
        if(this[i] && this[i].parentElement) {
            this[i].parentElement.removeChild(this[i]);
        }
    }
}