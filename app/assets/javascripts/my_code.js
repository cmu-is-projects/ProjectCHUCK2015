// $(document).ready(function () {
//   $('.sigPad').signaturePad();
// });


if ((window.location.pathname == '/households/new') || (window.location.pathname == '/households') || (window.location.pathname == '/registerstudent')){
	window.onload = function(){

		// $( "#accordion" ).accordion({
		// 	heightStyle: "content"
		// });

        $("#accordion").accordion({
            autoHeight: false,
            collapsible: true,
            heightStyle: "content",
            active: 0,
            animate: 100 // collapse will take 300ms
        });
        $('#accordion h3').bind('click',function(){
            var self = this;
            setTimeout(function() {
                theOffset = $(self).offset();
                $('body,html').animate({ scrollTop: theOffset.top - 140 });
            }, 110); // ensure the collapse animation is done
        });


        // $( "#accordion" ).accordion({
        // heightStyle: "content",
        // collapsible: true,
        // active: false,
        // activate: function( event, ui ) {
        //     if(!$.isEmptyObject(ui.newHeader.offset())) {
        //         $('html:not(:animated), body:not(:animated)').animate({ scrollTop: ui.newHeader.offset().top }, 'slow');
        //     }
        // }
		$('#accordion button').click(function(e) {
			e.preventDefault();
			var delta = ($(this).is('.next') ? 1 : -1);
			$('#accordion').accordion('option', 'active', ( $('#accordion').accordion('option','active') + delta  ));
            document.getElementById('accordiondiv').scrollIntoView();
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
        var household_conditions = (id.indexOf("household") > -1 && curr.type != 'hidden' && curr.type != 'radio')
        var volunteer_conditions = (id.indexOf("volunteer") > -1 && curr.type != 'hidden' && curr.type != 'radio')

        //draw household form validations
        drawValidations(household_conditions, curr, name, id);

        //draw volunteer form validations
        drawValidations(volunteer_conditions, curr, name, id);

    }

});

function drawValidations(conditions, curr, name, id){
    if(conditions){
        if(name.indexOf("agree") > -1){
            var lv2 = new LiveValidation(id, {validMessage: "I agree."});
            lv2.add( Validate.Acceptance, {failureMessage: "Must be accepted"});
        }else{
            var lv = new LiveValidation(id);
            // if(curr.required){
            //     lv.add( Validate.Presence )
            // }
            if(name.indexOf("email") > -1){
                lv.add( Validate.Format, {pattern:/^[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))$/i});
            }
            if(name.indexOf("phone") > -1){
                lv.add( Validate.Format, { pattern: /^\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$/, failureMessage: "Invalid format"});
            }
            if(name.indexOf("zip") > -1){
                lv.add(  Validate.Format, { pattern: /^\d{5}(?:[-\s]\d{4})?$/, failureMessage: "Invalid Format" }  );
            }
        }
    }
}

// $(document).on('nested:fieldAdded', function (event) {
//     var inputs = $('input')
//     for(var i =0; i< inputs.length;i++){
//         var curr = inputs[i]
//         var name = curr.name
//         var id = curr.id
//         var conditions = (id.indexOf("household") > -1 && curr.type != 'hidden' && curr.type != 'radio' && id.indexOf("_0_") == -1)
//         drawValidations(conditions, curr, name, id);
//     }  
// });


$(document).on('nested:fieldRemoved', function (event) {
    $('[required]', event.field).removeAttr('required');
  });



