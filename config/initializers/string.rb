class String
  def to_markdown
    text = self
    html_render_options = {
      filter_html:     true, # no input tag or textarea
      hard_wrap:       true,
      link_attributes: { rel: "nofollow" }
    }

    markdown_options = {
      autolink:           true,
      fenced_code_blocks: true,
      lax_spacing:        true,
      no_intra_emphasis:  true,
      strikethrough:      true,
      superscript:        true,
      tables:             true
    }

    renderer = Redcarpet::Render::HTML.new(html_render_options)
    markdown = Redcarpet::Markdown.new(renderer, markdown_options)
    markdown.render(text).html_safe
  end
end
