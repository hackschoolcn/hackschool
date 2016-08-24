module BreadcrumbHelper
  def render_breadcrumb
    return "" if @breadcrumbs.size <= 0
    prefix = "".html_safe
    crumb = "".html_safe

    @breadcrumbs.each_with_index do |c, i|
      breadcrumb_class = []
      breadcrumb_class << "first" if i.zero?
      breadcrumb_class << "last active" if i == (@breadcrumbs.length - 1)

      breadcrumb_content = c

      crumb += content_tag(:li, breadcrumb_content, class: breadcrumb_class) + "\n"
    end
    prefix + content_tag(:ul, crumb, class: "breadcrumb menu clearfix")
  end
end
