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
    city.add( Validate.Presence, { failureMessage: "Must fill out this field"});

    var zip = new LiveValidation('household_zip');
	zip.add(  Validate.Format, { pattern: /^\d{5}(?:[-\s]\d{4})?$/, failureMessage: "Invalid Format" }  );

	//GUARDIAN FIELDS
	//will need to loop through all guardians and students

    var pfname = new LiveValidation('household_guardians_attributes_0_first_name');
    pfname.add( Validate.Presence, { failureMessage: "Must fill out this field"});

    var plname = new LiveValidation('household_guardians_attributes_0_last_name');
    plname.add( Validate.Presence, { failureMessage: "Must fill out this field"});

    var best_num = new LiveValidation('household_guardians_attributes_0_cell_phone');
    best_num.add( Validate.Presence, { failureMessage: "Must fill out this field"});
    best_num.add( Validate.Format, { pattern: /^\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$/, failureMessage: "Invalid format"});

	var pemail = new LiveValidation('household_guardians_attributes_0_email');
    pemail.add( Validate.Format, {pattern:/[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))/i});
   
    //STUDENT FIELDS
    var sfname = new LiveValidation('household_students_attributes_0_first_name');
    sfname.add( Validate.Presence, { failureMessage: "Must fill out this field"});

    var slname = new LiveValidation('household_students_attributes_0_last_name');
    slname.add( Validate.Presence, { failureMessage: "Must fill out this field"});


    var student_cell = new LiveValidation('household_students_attributes_0_cell_phone');
    student_cell.add( Validate.Format, { pattern: /^\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$/, failureMessage: "Invalid format"});

	var semail = new LiveValidation('household_students_attributes_0_email');
    semail.add( Validate.Format, {pattern:/[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))/i});

    //emergency contact
    var ec_name = new LiveValidation('household_students_attributes_0_emergency_contact_name');
    ec_name.add( Validate.Presence, { failureMessage: "Must fill out this field"});

    var ec_relation = new LiveValidation('household_students_attributes_0_emergency_contact_relation');
    ec_relation.add( Validate.Presence, { failureMessage: "Must fill out this field"});

    var ec_phone = new LiveValidation('household_students_attributes_0_emergency_contact_phone');
    ec_phone.add( Validate.Format, { pattern: /^\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$/, failureMessage: "Invalid format"});
    ec_phone.add( Validate.Presence, { failureMessage: "Must fill out this field"});

    //medical/insurance
    var insurance = new LiveValidation('household_students_attributes_0_insurance_provider');
    insurance.add( Validate.Presence, { failureMessage: "Must fill out this field"});

    var policy_no = new LiveValidation('household_students_attributes_0_insurance_policy_no');
    policy_no.add( Validate.Presence, { failureMessage: "Must fill out this field"});

    var physician = new LiveValidation('household_students_attributes_0_family_physician');
    physician.add( Validate.Presence, { failureMessage: "Must fill out this field"});

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
    steet.add( Validate.Presence, { failureMessage: "Must fill out this field"} );
    









};


$(document).ready(function() {
  $('.sigPad').signaturePad({drawOnly:true});
});
