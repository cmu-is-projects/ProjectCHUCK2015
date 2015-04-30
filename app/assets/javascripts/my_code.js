// $(document).ready(function () {
//   $('.sigPad').signaturePad();
// });
// $(function() {
//     $( "#accordion" ).accordion({
//       heightStyle: "content"
//     });
//   });
if (window.location.pathname == '/households/new') {
	window.onload = function(){

		$( "#accordion" ).accordion({
			heightStyle: "content"
		});
		$('#accordion button').click(function(e) {
			e.preventDefault();
			var delta = ($(this).is('.next') ? 1 : -1);
			$('#accordion').accordion('option', 'active', ( $('#accordion').accordion('option','active') + delta  ));
		});
    
    };
};


$(document).ready(function() {
  $('.sigPad').signaturePad({drawOnly:true});

  //collect inputs and make conditions for drawValidations()
    var inputs = $('input')
    for(var i =0; i< inputs.length;i++){
        var curr = inputs[i]
        var name = curr.name
        var id = curr.id
        var conditions = (id.indexOf("household") > -1 && curr.type != 'hidden' && curr.type != 'radio')
        drawValidations(conditions, curr, name, id);

    }

});

  function drawValidations(conditions, curr, name, id){
    if(conditions){
        var lv = new LiveValidation(id);
        if(curr.required){
            lv.add( Validate.Presence )
        }
        if(name.indexOf("email") > -1){
            lv.add( Validate.Format, {pattern:/[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))/i});
        }
        if(name.indexOf("phone") > -1){
            lv.add( Validate.Format, { pattern: /^\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$/, failureMessage: "Invalid format"});
        }
        if(name.indexOf("zip") > -1){
            lv.add(  Validate.Format, { pattern: /^\d{5}(?:[-\s]\d{4})?$/, failureMessage: "Invalid Format" }  );
        }
        if(name.indexOf("agree") > -1){
            lv.add( Validate.Acceptance );
        }
    }
  }

$(document).on('nested:fieldAdded', function (event) {
    var inputs = $('input')
    for(var i =0; i< inputs.length;i++){
        var curr = inputs[i]
        var name = curr.name
        var id = curr.id
        var conditions = (id.indexOf("household") > -1 && curr.type != 'hidden' && curr.type != 'radio' && id.indexOf("_0_") == -1)
        drawValidations(conditions, curr, name, id);
    }  
});

$(document).on('nested:fieldRemoved', function (event) {
    $('[required]', event.field).removeAttr('required');
  });
