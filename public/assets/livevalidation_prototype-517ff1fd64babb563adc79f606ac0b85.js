var LiveValidation=Class.create();Object.extend(LiveValidation,{VERSION:"1.3 prototype",TEXTAREA:1,TEXT:2,PASSWORD:3,CHECKBOX:4,SELECT:5,FILE:6,massValidate:function(e){for(var t=!0,i=0,a=e.length;a>i;++i){var s=e[i].validate();t&&(t=s)}return t}}),LiveValidation.prototype={validClass:"LV_valid",invalidClass:"LV_invalid",messageClass:"LV_validation_message",validFieldClass:"LV_valid_field",invalidFieldClass:"LV_invalid_field",initialize:function(e,t){if(!e)throw new Error("LiveValidation::initialize - No element reference or element id has been provided!");if(this.element=$(e),!this.element)throw new Error("LiveValidation::initialize - No element with reference or id of '"+e+"' exists!");this.elementType=this.getElementType(),this.validations=[],this.form=this.element.form,this.options=Object.extend({validMessage:"Thankyou!",onValid:function(){this.insertMessage(this.createMessageSpan()),this.addFieldClass()},onInvalid:function(){this.insertMessage(this.createMessageSpan()),this.addFieldClass()},insertAfterWhatNode:this.element,onlyOnBlur:!1,wait:0,onlyOnSubmit:!1},t||{});var i=this.options.insertAfterWhatNode||this.element;if(this.options.insertAfterWhatNode=$(i),Object.extend(this,this.options),this.form&&(this.formObj=LiveValidationForm.getInstance(this.form),this.formObj.addField(this)),this.boundFocus=this.doOnFocus.bindAsEventListener(this),Event.observe(this.element,"focus",this.boundFocus),!this.onlyOnSubmit)switch(this.elementType){case LiveValidation.CHECKBOX:this.boundClick=this.validate.bindAsEventListener(this),Event.observe(this.element,"click",this.boundClick);case LiveValidation.SELECT:case LiveValidation.FILE:this.boundChange=this.validate.bindAsEventListener(this),Event.observe(this.element,"change",this.boundChange);break;default:this.onlyOnBlur||(this.boundKeyup=this.deferValidation.bindAsEventListener(this),Event.observe(this.element,"keyup",this.boundKeyup)),this.boundBlur=this.validate.bindAsEventListener(this),Event.observe(this.element,"blur",this.boundBlur)}},destroy:function(){if(this.formObj&&(this.formObj.removeField(this),this.formObj.destroy()),Event.stopObserving(this.element,"focus",this.boundFocus),!this.onlyOnSubmit)switch(this.elementType){case LiveValidation.CHECKBOX:Event.stopObserving(this.element,"click",this.boundClick);case LiveValidation.SELECT:case LiveValidation.FILE:Event.stopObserving(this.element,"change",this.boundChange);break;default:this.onlyOnBlur||Event.stopObserving(this.element,"keyup",this.boundKeyup),Event.stopObserving(this.element,"blur",this.boundBlur)}this.validations=[],this.removeMessageAndFieldClass()},add:function(e,t){return this.validations.push({type:e,params:t||{}}),this},remove:function(e,t){return this.validations=this.validations.reject(function(i){return i.type==e&&i.params==t}),this},deferValidation:function(){this.wait>=300&&this.removeMessageAndFieldClass(),this.timeout&&clearTimeout(this.timeout),this.timeout=setTimeout(this.validate.bind(this),this.wait)},doOnBlur:function(){this.focused=!1,this.validate()},doOnFocus:function(){this.focused=!0,this.removeMessageAndFieldClass()},getElementType:function(){switch(!0){case"TEXTAREA"==this.element.nodeName.toUpperCase():return LiveValidation.TEXTAREA;case"INPUT"==this.element.nodeName.toUpperCase()&&"TEXT"==this.element.type.toUpperCase():return LiveValidation.TEXT;case"INPUT"==this.element.nodeName.toUpperCase()&&"PASSWORD"==this.element.type.toUpperCase():return LiveValidation.PASSWORD;case"INPUT"==this.element.nodeName.toUpperCase()&&"CHECKBOX"==this.element.type.toUpperCase():return LiveValidation.CHECKBOX;case"INPUT"==this.element.nodeName.toUpperCase()&&"FILE"==this.element.type.toUpperCase():return LiveValidation.FILE;case"SELECT"==this.element.nodeName.toUpperCase():return LiveValidation.SELECT;case"INPUT"==this.element.nodeName.toUpperCase():throw new Error("LiveValidation::getElementType - Cannot use LiveValidation on an "+this.element.type+" input!");default:throw new Error("LiveValidation::getElementType - Element must be an input, select, or textarea!")}},doValidations:function(){this.validationFailed=!1;for(var e=0,t=this.validations.length;t>e;++e){var i=this.validations[e];switch(i.type){case Validate.Presence:case Validate.Confirmation:case Validate.Acceptance:this.displayMessageWhenEmpty=!0,this.validationFailed=!this.validateElement(i.type,i.params);break;default:this.validationFailed=!this.validateElement(i.type,i.params)}if(this.validationFailed)return!1}return this.message=this.validMessage,!0},validateElement:function(e,t){var i=this.elementType==LiveValidation.SELECT?this.element.options[this.element.selectedIndex].value:this.element.value;if(e==Validate.Acceptance){if(this.elementType!=LiveValidation.CHECKBOX)throw new Error("LiveValidation::validateElement - Element to validate acceptance must be a checkbox!");i=this.element.checked}var a=!0;try{e(i,t)}catch(s){if(!(s instanceof Validate.Error))throw s;(""!==i||""===i&&this.displayMessageWhenEmpty)&&(this.validationFailed=!0,this.message=s.message,a=!1)}finally{return a}},validate:function(){if(this.element.disabled)return!0;var e=this.doValidations();return e?(this.onValid(),!0):(this.onInvalid(),!1)},enable:function(){return this.element.disabled=!1,this},disable:function(){return this.element.disabled=!0,this.removeMessageAndFieldClass(),this},createMessageSpan:function(){var e=document.createElement("span"),t=document.createTextNode(this.message);return e.appendChild(t),e},insertMessage:function(e){this.removeMessage();var t=this.validationFailed?this.invalidClass:this.validClass;(this.displayMessageWhenEmpty&&(this.elementType==LiveValidation.CHECKBOX||""==this.element.value)||""!=this.element.value)&&($(e).addClassName(this.messageClass+(" "+t)),(nxtSibling=this.insertAfterWhatNode.nextSibling)?this.insertAfterWhatNode.parentNode.insertBefore(e,nxtSibling):this.insertAfterWhatNode.parentNode.appendChild(e))},addFieldClass:function(){this.removeFieldClass(),this.validationFailed?this.element.hasClassName(this.invalidFieldClass)||this.element.addClassName(this.invalidFieldClass):(this.displayMessageWhenEmpty||""!=this.element.value)&&(this.element.hasClassName(this.validFieldClass)||this.element.addClassName(this.validFieldClass))},removeMessage:function(){(nxtEl=this.insertAfterWhatNode.next("."+this.messageClass))&&nxtEl.remove()},removeFieldClass:function(){this.element.removeClassName(this.invalidFieldClass),this.element.removeClassName(this.validFieldClass)},removeMessageAndFieldClass:function(){this.removeMessage(),this.removeFieldClass()}};var LiveValidationForm=Class.create();Object.extend(LiveValidationForm,{instances:{},getInstance:function(e){var t=Math.random()*Math.random();return e.id||(e.id="formId_"+t.toString().replace(/\./,"")+(new Date).valueOf()),LiveValidationForm.instances[e.id]||(LiveValidationForm.instances[e.id]=new LiveValidationForm(e)),LiveValidationForm.instances[e.id]}}),LiveValidationForm.prototype={initialize:function(e){this.element=$(e),this.fields=[],this.oldOnSubmit=this.element.onsubmit||function(){},this.element.onsubmit=function(e){var t=LiveValidation.massValidate(this.fields)?this.oldOnSubmit.call(this.element,e)!==!1:!1;t||Event.stop(e)}.bindAsEventListener(this)},addField:function(e){this.fields.push(e)},removeField:function(e){this.fields=this.fields.without(e)},destroy:function(e){return 0==this.fields.length||e?(this.element.onsubmit=this.oldOnSubmit,LiveValidationForm.instances[this.element.id]=null,!0):!1}};var Validate={Presence:function(e,t){var i=Object.extend({failureMessage:"Can't be empty!"},t||{});return(""===e||null===e||void 0===e)&&Validate.fail(i.failureMessage),!0},Numericality:function(e,t){var i=e,e=Number(e),t=t||{},a={notANumberMessage:t.notANumberMessage||"Must be a number!",notAnIntegerMessage:t.notAnIntegerMessage||"Must be an integer!",wrongNumberMessage:t.wrongNumberMessage||"Must be "+t.is+"!",tooLowMessage:t.tooLowMessage||"Must not be less than "+t.minimum+"!",tooHighMessage:t.tooHighMessage||"Must not be more than "+t.maximum+"!",is:t.is||0==t.is?t.is:null,minimum:t.minimum||0==t.minimum?t.minimum:null,maximum:t.maximum||0==t.maximum?t.maximum:null,onlyInteger:t.onlyInteger||!1};switch(isFinite(e)||Validate.fail(a.notANumberMessage),a.onlyInteger&&(/\.0+$|\.$/.test(String(i))||e!=parseInt(e))&&Validate.fail(a.notAnIntegerMessage),!0){case null!==a.is:e!=Number(a.is)&&Validate.fail(a.wrongNumberMessage);break;case null!==a.minimum&&null!==a.maximum:Validate.Numericality(e,{tooLowMessage:a.tooLowMessage,minimum:a.minimum}),Validate.Numericality(e,{tooHighMessage:a.tooHighMessage,maximum:a.maximum});break;case null!==a.minimum:e<Number(a.minimum)&&Validate.fail(a.tooLowMessage);break;case null!==a.maximum:e>Number(a.maximum)&&Validate.fail(a.tooHighMessage)}return!0},Format:function(e,t){var e=String(e),i=Object.extend({failureMessage:"Not valid!",pattern:/./,negate:!1},t||{});return i.negate||i.pattern.test(e)||Validate.fail(i.failureMessage),i.negate&&i.pattern.test(e)&&Validate.fail(i.failureMessage),!0},Email:function(e,t){var i=Object.extend({failureMessage:"Must be a valid email address!"},t||{});return Validate.Format(e,{failureMessage:i.failureMessage,pattern:/^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}),!0},Length:function(e,t){var e=String(e),t=t||{},i={wrongLengthMessage:t.wrongLengthMessage||"Must be "+t.is+" characters long!",tooShortMessage:t.tooShortMessage||"Must not be less than "+t.minimum+" characters long!",tooLongMessage:t.tooLongMessage||"Must not be more than "+t.maximum+" characters long!",is:t.is||0==t.is?t.is:null,minimum:t.minimum||0==t.minimum?t.minimum:null,maximum:t.maximum||0==t.maximum?t.maximum:null};switch(!0){case null!==i.is:e.length!=Number(i.is)&&Validate.fail(i.wrongLengthMessage);break;case null!==i.minimum&&null!==i.maximum:Validate.Length(e,{tooShortMessage:i.tooShortMessage,minimum:i.minimum}),Validate.Length(e,{tooLongMessage:i.tooLongMessage,maximum:i.maximum});break;case null!==i.minimum:e.length<Number(i.minimum)&&Validate.fail(i.tooShortMessage);break;case null!==i.maximum:e.length>Number(i.maximum)&&Validate.fail(i.tooLongMessage);break;default:throw new Error("Validate::Length - Length(s) to validate against must be provided!")}return!0},Inclusion:function(e,t){var i=Object.extend({failureMessage:"Must be included in the list!",within:[],allowNull:!1,partialMatch:!1,caseSensitive:!0,negate:!1},t||{});if(i.allowNull&&null==e)return!0;if(i.allowNull||null!=e||Validate.fail(i.failureMessage),!i.caseSensitive){var a=[];i.within.each(function(e){"string"==typeof e&&(e=e.toLowerCase()),a.push(e)}),i.within=a,"string"==typeof e&&(e=e.toLowerCase())}var s=-1==i.within.indexOf(e)?!1:!0;return i.partialMatch&&(s=!1,i.within.each(function(t){-1!=e.indexOf(t)&&(s=!0)})),(!i.negate&&!s||i.negate&&s)&&Validate.fail(i.failureMessage),!0},Exclusion:function(e,t){var i=Object.extend({failureMessage:"Must not be included in the list!",within:[],allowNull:!1,partialMatch:!1,caseSensitive:!0},t||{});return i.negate=!0,Validate.Inclusion(e,i),!0},Confirmation:function(e,t){if(!t.match)throw new Error("Validate::Confirmation - Error validating confirmation: Id of element to match must be provided!");var i=Object.extend({failureMessage:"Does not match!",match:null},t||{});if(i.match=$(t.match),!i.match)throw new Error("Validate::Confirmation - There is no reference with name of, or element with id of '"+i.match+"'!");return e!=i.match.value&&Validate.fail(i.failureMessage),!0},Acceptance:function(e,t){var i=Object.extend({failureMessage:"Must be accepted!"},t||{});return e||Validate.fail(i.failureMessage),!0},Custom:function(e,t){var i=Object.extend({against:function(){return!0},args:{},failureMessage:"Not valid!"},t||{});return i.against(e,i.args)||Validate.fail(i.failureMessage),!0},now:function(e,t,i){if(!e)throw new Error("Validate::now - Validation function must be provided!");var a=!0;try{e(t,i||{})}catch(s){if(!(s instanceof Validate.Error))throw s;a=!1}finally{return a}},Error:function(e){this.message=e,this.name="ValidationError"},fail:function(e){throw new Validate.Error(e)}};