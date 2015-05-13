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
    $('dropdown-toggle').dropdown()
});


$(document).ready(function() {


  $('.sigPad').signaturePad({
    drawOnly: true, lineTop: 120
  });
      

  //collect inputs and make conditions for drawValidations()
    var inputs = $('input')
    for(var i =0; i< inputs.length;i++){
        var curr = inputs[i]
        var name = curr.name
        var id = curr.id
        var household_conditions = (id.indexOf("household") > -1 && curr.type != 'hidden' && curr.type != 'radio')
        var volunteer_conditions = (id.indexOf("volunteer") > -1 && curr.type != 'hidden' && curr.type != 'radio')

    }
});





$(document).ready(function() {

// $(document).on('nested:fieldAdded', function (event) {
//     $('.sigPad').signaturePad({drawOnly:true});
// }

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

$(document).ready(function() {

var hidWidth;
var scrollBarWidths = 30;

var widthOfList = function(){
  var itemsWidth = 0;
  $('.list li').each(function(){
    var itemWidth = $(this).outerWidth();
    itemsWidth+=itemWidth;
  });
  return itemsWidth;
};

var widthOfHidden = function(){
  return (($('.wrapper').outerWidth())-widthOfList()-getLeftPosi())-scrollBarWidths;
};

var getLeftPosi = function(){
  return $('.list').position().left;
};

var reAdjust = function(){
  if (($('.wrapper').outerWidth()) < widthOfList()) {
    $('.scroller-right').show();
  }
  else {
    $('.scroller-right').hide();
  }
  
  if (getLeftPosi()<0) {
    $('.scroller-left').show();
  }
  else {
    $('.item').animate({left:"-="+getLeftPosi()+"px"},'slow');
   $('.scroller-left').hide();
  }
}

reAdjust();

$(window).on('resize',function(e){  
   reAdjust();
});

$('.scroller-right').click(function() {
  
  $('.scroller-left').fadeIn('slow');
  $('.scroller-right').fadeOut('slow');
  
  $('.list').animate({left:"+="+widthOfHidden()+"px"},'slow',function(){

  });
});

$('.scroller-left').click(function() {
  
 $('.scroller-right').fadeIn('slow');
 $('.scroller-left').fadeOut('slow');
  
   $('.list').animate({left:"-="+getLeftPosi()+"px"},'slow',function(){
    
   });
});  

});  


// Scrollable nav code below

// var hidWidth;
// var scrollBarWidths = 30;

// var widthOfList = function(){
//   var itemsWidth = 0;
//   $('.list li').each(function(){
//     var itemWidth = $(this).outerWidth();
//     itemsWidth+=itemWidth;
//   });
//   return itemsWidth;
// };

// var widthOfHidden = function(){
//   return (($('.wrapper').outerWidth())-widthOfList()-getLeftPosi())-scrollBarWidths;
// };

// var getLeftPosi = function(){
//   return $('.list').position().left;
// };

// var reAdjust = function(){
//   if (($('.wrapper').outerWidth()) < widthOfList()) {
//     $('.scroller-right').show();
//   }
//   else {
//     $('.scroller-right').hide();
//   }
  
//   if (getLeftPosi()<0) {
//     $('.scroller-left').show();
//   }
//   else {
//     $('.item').animate({left:"-="+getLeftPosi()+"px"},'slow');
//     $('.scroller-left').hide();
//   }
// }

// reAdjust();

// $(window).on('resize',function(e){  
//     reAdjust();
// });

// $('.scroller-right').click(function() {
  
//   $('.scroller-left').fadeIn('slow');
//   $('.scroller-right').fadeOut('slow');
  
//   $('.list').animate({left:"+="+widthOfHidden()+"px"},'slow',function(){

//   });
// });

// $('.scroller-left').click(function() {
  
//     $('.scroller-right').fadeIn('slow');
//     $('.scroller-left').fadeOut('slow');
  
//     $('.list').animate({left:"-="+getLeftPosi()+"px"},'slow',function(){
    
//     });
// });    




