module MixtapesHelper
  def title_with_explicit_label(mixtape)
    if mixtape.explicit
      html = content_tag(:span, "Explicit", :class => "label label-important", :style => "margin-left: 10px;")
    else
      html = ""
    end

    (mixtape.title + html).html_safe
  end
end
