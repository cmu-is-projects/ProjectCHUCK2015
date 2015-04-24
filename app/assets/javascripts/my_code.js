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

    //***HOUSEHOLD FORM**** 

    //HOUSEHOLD FIELDS
    var city = new LiveValidation('household_city');
    city.add( Validate.Presence);

    var zip = new LiveValidation('household_zip');
	zip.add(  Validate.Format, { pattern: /^\d{5}(?:[-\s]\d{4})?$/, failureMessage: "Invalid Format" }  );

	//GUARDIAN FIELDS
	//will need to loop through all guardians and students

    var pfname = new LiveValidation('household_guardians_attributes_0_first_name');
    pfname.add( Validate.Presence);

    var plname = new LiveValidation('household_guardians_attributes_0_last_name');
    plname.add( Validate.Presence);

    var best_num = new LiveValidation('household_guardians_attributes_0_cell_phone');
    best_num.add( Validate.Presence);
    best_num.add( Validate.Format, { pattern: /^\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$/, failureMessage: "Invalid format"});

	var pemail = new LiveValidation('household_guardians_attributes_0_email');
    pemail.add( Validate.Format, {pattern:/[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))/i});
   
    //STUDENT FIELDS
    var sfname = new LiveValidation('household_students_attributes_0_first_name');
    sfname.add( Validate.Presence);

    var slname = new LiveValidation('household_students_attributes_0_last_name');
    slname.add( Validate.Presence);


    var student_cell = new LiveValidation('household_students_attributes_0_cell_phone');
    student_cell.add( Validate.Format, { pattern: /^\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$/, failureMessage: "Invalid format"});

	var semail = new LiveValidation('household_students_attributes_0_email');
    semail.add( Validate.Format, {pattern:/[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))/i});

    //emergency contact
    var ec_name = new LiveValidation('household_students_attributes_0_emergency_contact_name');
    ec_name.add( Validate.Presence);

    var ec_relation = new LiveValidation('household_students_attributes_0_emergency_contact_relation');
    ec_relation.add( Validate.Presence);

    var ec_phone = new LiveValidation('household_students_attributes_0_emergency_contact_phone');
    ec_phone.add( Validate.Format, { pattern: /^\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$/, failureMessage: "Invalid format"});
    ec_phone.add( Validate.Presence);

    //medical/insurance
    var insurance = new LiveValidation('household_students_attributes_0_insurance_provider');
    insurance.add( Validate.Presence);

    var policy_no = new LiveValidation('household_students_attributes_0_insurance_policy_no');
    policy_no.add( Validate.Presence);

    var physician = new LiveValidation('household_students_attributes_0_family_physician');
    physician.add( Validate.Presence);

    var physician_phone = new LiveValidation('household_students_attributes_0_physician_phone');
    physician_phone.add( Validate.Format, { pattern: /^\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$/, failureMessage: "Invalid format"});

    //Agreements
    var medconsent = new LiveValidation('household_students_attributes_0_parent_consent_agree', {validMessage: "Thank you"});
	medconsent.add( Validate.Acceptance );

	var parent_promise = new LiveValidation('household_students_attributes_0_parent_promise_agree', {validMessage: "Thank you"});
	parent_promise.add( Validate.Acceptance );

	var student_promise = new LiveValidation('household_students_attributes_0_child_promise_agree', {validMessage: "Thank you"});
	student_promise.add( Validate.Acceptance );

	var release = new LiveValidation('household_students_attributes_0_parent_release_agree', {validMessage: "Thank you"});
	release.add( Validate.Acceptance );
   	
   	var street = new LiveValidation('household_street');
    street.add( Validate.Presence );

    $("#myid_1").redraw();
    
};


$(document).ready(function() {
  $('.sigPad').signaturePad({drawOnly:true});
});

$(document).on('nested:fieldRemoved', function (event) {
    $('[required]', event.field).removeAttr('required');
  });
