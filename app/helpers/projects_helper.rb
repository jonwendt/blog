module ProjectsHelper
  def title_with_link(project)
    if project.download_link
      link_to project.title, project.download_link 
    else
      project.title
    end
  end
end
