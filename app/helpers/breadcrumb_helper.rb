module BreadcrumbHelper
  def render_breadcrumb
    return "" if @breadcrumbs.size <= 0
    content_tag(:ul, class: "breadcrumb menu clearfix") do
      @breadcrumbs.each_with_index do |c, i|
        breadcrumb_class = []
        breadcrumb_class << "first" if i.zero?
        breadcrumb_class << "last active" if i == (@breadcrumbs.length - 1)

        breadcrumb_content = c

        concat content_tag(:li, breadcrumb_content, class: breadcrumb_class)
      end
    end
  end
end
