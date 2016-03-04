module ApplicationHelper
  def active_class(link_path)
   current_page?(link_path) ? "active" : ""
  end

  def nav_link(name, link_path, opts)
    content_tag :li, class: "nav-item #{active_class(link_path)}" do
      link_to name, link_path, class: 'nav-link', opts
    end
  end
end
