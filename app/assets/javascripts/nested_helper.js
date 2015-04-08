function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}

function add_double_fields(link, association1, association2, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association1, "g")
  var new_id_2 = new Date().getTime();
  var regexp2 = new RegExp("new_" + association2, "g")
  $(link).parent().before(content.replace(regexp, new_id));
  $(link).parent().before(content.replace(regexp2, new_id_2));
}