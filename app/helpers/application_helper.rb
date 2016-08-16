module ApplicationHelper

  def render_formatted_time(time)
    if time
      time.to_formatted_s(:db) 
    end
  end

end
