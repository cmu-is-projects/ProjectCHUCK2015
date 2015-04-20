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
    
};


$(document).ready(function() {
  $('.sigPad').signaturePad({drawOnly:true});
});
