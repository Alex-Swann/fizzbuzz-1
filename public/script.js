
function fizzaway(content) {
	switch(content) {
    	case 'fizz':
        	stuff = '<span class="result fizz" >'+ content +'</span>';
        	break;
        case 'buzz':
        	stuff = '<span class="result buzz" >'+ content +'</span>';
        	break;
        case 'fizzbuzz':
        	stuff = '<span class="result" > <i class="fizz">'+ 
        	content.substr(0, 4) +
        	'</i><i class="buzz">'+
        	content.substr(4, 7) +
        	'</i> </span>';
        	break;
    	default:
    		stuff = '<span class="result" >'+ content +'</span>';
	} 
	$(stuff).hide().appendTo('#buzzing').fadeIn(200, function() {console.log(content)});
}

$(function() {
    var i;
    for (i = 0; i < fizzbuzz_array.length; i++) {
    	setTimeout(fizzaway(fizzbuzz_array[i]), 1000);
    }
});
