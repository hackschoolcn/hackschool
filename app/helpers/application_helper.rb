module ApplicationHelper
  def render_formatted_time(time)
    time.to_formatted_s(:db) if time
  end

  def markdown_to_html(text)
    text.to_markdown
  end
end
