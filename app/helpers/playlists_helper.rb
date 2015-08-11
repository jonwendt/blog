module PlaylistsHelper
  def title_with_explicit_label(playlist)
    if playlist.explicit
      explicit_tag = content_tag(:span, "Explicit", :class => "label label-important", :style => "margin-left: 10px;")
    end

    (playlist.title + explicit_tag.to_s).html_safe
  end
end
