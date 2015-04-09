window.filter_students =

  submit_filter: (filter_type) ->
    console.log(filter_type)
    $.ajax({
        type: "POST",
        url: "/students",
        dataType: 'script',
        data: {filter: filter_type},
        success:(data) ->
          $('#students').empty()
          students = JSON.parse(data)
          i = 0
          while i < students.length
            student = JSON.parse(students[i])
            element = $("<a>").addClass('list-group-item').attr("href", "http://localhost:3000/students/" + student.id)
            element.addClass(student.area.toLowerCase())
            content = $("<div>").addClass('title')
            element.append(content)
            $('#students').append(element)
            i++
          return false
        error: (data) ->
          return false
      })

$(document).ready ->

  $('.list-group').hide();
  $('#alphabetical').show();

  jQuery("abbr.timeago").timeago();

  $(".filter_button").click ->
    console.log('clicked')
    window.filter_students.submit_filter($(this).attr("filter_type"))
  return

return