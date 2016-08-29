module ApplicationHelper
  def render_formatted_time(time)
    time.to_formatted_s(:db) if time
  end

  def render_markdown_text(text)
    text.to_markdown
  end

  def avatar_url
    "http://en.gravatar.com/userimage/109074261/af31ff7a90c4367bd91d50f97e25d885.png"
  end

  def gender_type
    if @user.gender == 'true'
      "Male"
    elsif @user.gender == 'false'
      "Female"      
    else
      ""
    end
  end

  def render_progress_bar(percent)
    percentage = percent.to_s + "%"
    if percent.to_f > 99.9.to_f
      content_tag :div, class: "progress" do
        content_tag :div, class: %w(progress-bar progress-bar-success), role: "progressbar", 'aria-valuenow': percent.to_s, 'aria-valuemin': "0", 'aria-valuemax': "100", 'style': "width: "+ percentage + ";min-width:2em;"  do
           percentage
        end
      end
    else
      content_tag :div, class: "progress" do
        content_tag :div, class: %w(progress-bar progress-bar-striped active), role: "progressbar", 'aria-valuenow': percent.to_s, 'aria-valuemin': "0", 'aria-valuemax': "100", 'style': "width: "+ percentage + ";min-width:2em;"  do
           percentage
        end
      end
    end
  end

end
