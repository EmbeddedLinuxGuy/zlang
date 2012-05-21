var from = "Pack my box with five dozen liquor jugs.";

function populate () {
    document.getElementById('from').value = from;
    translate();
}

var id = 1000;
var start_id = id;

function clone () {
    $('#maps').append('<br />');
    $('#maps').append('<input type="text" size="5" id="in' + id  + '" />');
    $('#maps').append('=');
    $('#maps').append('<input type="text" size="5" id="out' + id + '" />');
    ++id;
}

function translate () {
    var to = $('#from').val();
    var i;
    for (i=start_id; i < id; ++i) {
	console.log($('#in'+i).val() + " -> " +  $('#out'+i).val());

	var regex = new RegExp($('#in'+i).val(), "g");
	var holder = "\x{f" + i + "}";
	to = to.replace(regex, holder);
    }
    for (i=start_id; i < id; ++i) {
	var holder = "\x{f" + i + "}";
	var r2 = new RegExp(holder, "g");
	to = to.replace(r2, $('#out'+i).val());
    }
    document.getElementById('to').innerHTML = to;
}
