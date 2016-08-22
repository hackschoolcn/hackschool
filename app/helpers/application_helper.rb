module ApplicationHelper
  def render_formatted_time(time)
    time.to_formatted_s(:db) if time
  end

  def render_markdown_text(text)
    text.to_markdown
  end

  def avatar_url
    'http://imageshack.com/a/img922/5779/PiahZl.jpg'
  end
end
