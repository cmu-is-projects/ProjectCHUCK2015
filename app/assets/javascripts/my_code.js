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
                $('body,html').animate({ scrollTop: theOffset.top - 145 });
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
  $('.sigPad').signaturePad({drawOnly:true, validateFields:false});
});




$(document).ready(function() {

    $.validator.addMethod("zip", function(value, element) {
        return this.optional(element) || /\d{5}(?:[-\s]\d{4})?/.test(value);
    }, "Please specify valid zip code");


    $("#new_household").validate();
    $.validator.addClassRules({
        phone: {
            phoneUS: true 
        },
        email: {
            email: true
        },
        required: {
            required: true
        }
    });

    $("#new_volunteer").validate();
    $.validator.addClassRules({
        phone: {
            phoneUS: true 
        },
        email: {
            email: true
        },
        required: {
            required: true
        }
    });
});


$(document).on('nested:fieldRemoved', function (event) {
    $('[required]', event.field).removeAttr('required');
  });



