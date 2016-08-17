module ApplicationHelper

  def render_formatted_time(time)
    if time
      time.to_formatted_s(:db) 
    end
  end

  def markdown_to_html(text)
    html_render_options = {
      filter_html:     true, # no input tag or textarea
      hard_wrap:       true,
      link_attributes: { rel: 'nofollow' }
    }

    markdown_options = {
      autolink:           true,
      fenced_code_blocks: true,
      lax_spacing:        true,
      no_intra_emphasis:  true,
      strikethrough:      true,
      superscript:        true
    }

    renderer = Redcarpet::Render::HTML.new(html_render_options)
    markdown = Redcarpet::Markdown.new(renderer, markdown_options)
    raw markdown.render(text)
  end

end
