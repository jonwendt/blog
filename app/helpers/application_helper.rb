module ApplicationHelper
  def nav_link(title, url, options = {})
    linked_controller = Rails.application.routes.recognize_path(url)[:controller]
    link_class = (params[:controller] == linked_controller) ? "active" : ""

    content_tag(:li, link_to(title, url), :class => link_class)
  end

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end
  
  def link_to_add_fields(name, f, association)
    post_content = f.object.post_contents.new
    # new_object = f.object.class.reflect_on_association(association).klass.new
    new_object = association.to_s.classify.constantize.new
    post_content.content = new_object
    fields = nil
    f.fields_for(:post_contents, f.object) do |pcf|
      fields = pcf.fields_for(:content, new_object, :child_index => "new_#{association}") do |builder|
        render(association.to_s.singularize + "_fields", :f => builder)
        # render("post_content_fields", :f => builder)
      end
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")", :style => "margin-right: 10px;")
  end
end

# link_to_add_fields "Add Text", post form, :texts

#  <p><%= link_to_add_fields "Add Text", f, :texts %><p>
