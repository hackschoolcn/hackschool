module ApplicationHelper
  def render_formatted_time(time)
    time.to_formatted_s(:db) if time
  end

  def render_markdown_text(text)
    text.to_markdown
  end

  def avatar_url
    'http://en.gravatar.com/userimage/109074261/af31ff7a90c4367bd91d50f97e25d885.png'
  end
end
