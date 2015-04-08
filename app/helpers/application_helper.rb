module ApplicationHelper
  def link_to_add_double(name, f, association1, association2)
    embedded = Object.const_get(association1.to_s.singularize.capitalize)
    new_object_1 = f.object.class.reflect_on_association(association1).klass.new
    new_object_2 = embedded.reflect_on_association(association2).klass.new
    fields_1 = f.fields_for(association1, new_object_1, :child_index => "new_#{association1}") do |builder|
      render(association1.to_s.singularize + "_fields", :f => builder)
    end
    fields_2 = f.fields_for(association2, new_object_2, :child_index => "new_#{association2}") do |builder|
      render(association2.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, ("add_double_fields(this, \"#{association1}\", \"#{association2}\", \"#{escape_javascript(fields_1)} #{escape_javascript(fields_2)}\")"))
    # link_to_function(name, ("add_fields(this, \"#{association2}\", \"#{escape_javascript(fields_2)}\")"))
  end
end

# def link_to_add_fields(name, f, association)
#   new_object = f.object.class.reflect_on_association(association).klass.new
#   fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
#     render(association.to_s.singularize + "_fields", :f => builder)
#   end
#   link_to_function(name, h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
# end