module MixtapesHelper
  def title_with_explicit_label(mixtape)
    if mixtape.explicit
      explicit_tag = content_tag(:span, "Explicit", :class => "label label-important", :style => "margin-left: 10px;")
    end

    (mixtape.title + explicit_tag.to_s).html_safe
  end
end
