// $(document).ready(function () {
//   $('.sigPad').signaturePad();
// });
// $(function() {
//     $( "#accordion" ).accordion({
//       heightStyle: "content"
//     });
//   });

window.onload = function(){
    $( "#accordion" ).accordion({
      heightStyle: "content"
    });
    $('#accordion button').click(function(e) {
        e.preventDefault();
        var delta = ($(this).is('.next') ? 1 : -1);
        $('#accordion').accordion('option', 'active', ( $('#accordion').accordion('option','active') + delta  ));
    });


    //Livevalidations
    // var home_phone = new LiveValidation('household_home_phone');

    var city = new LiveValidation('household_city');
    city.add( Validate.Presence, { failureMessage: "Must fill out this field"});

    var zip = new LiveValidation('household_zip');
	zip.add(  Validate.Format, { pattern: /^\d{5}(?:[-\s]\d{4})?$/, failureMessage: "Invalid Format" }  );

	//will need to loop through all guardians and students
	//Guardian fields
    var pfname = new LiveValidation('household_guardians_attributes_0_first_name');
    pfname.add( Validate.Presence, { failureMessage: "Must fill out this field"});

    var plname = new LiveValidation('household_guardians_attributes_0_last_name');
    plname.add( Validate.Presence, { failureMessage: "Must fill out this field"});

    var best_num = new LiveValidation('household_guardians_attributes_0_cell_phone');
    best_num.add( Validate.Presence, { failureMessage: "Must fill out this field"});
    best_num.add( Validate.Format, { pattern: /^\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$/, failureMessage: "Invalid format"});

    var email = new LiveValidation('household_guardians_attributes_0_email');
    email.add( Validate.Format, {pattern:/[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))/i})
    

   	var street = new LiveValidation('household_street');
    steet.add( Validate.Presence, { failureMessage: "Must fill out this field"} );
    









};


$(document).ready(function() {
  $('.sigPad').signaturePad({drawOnly:true});
});
