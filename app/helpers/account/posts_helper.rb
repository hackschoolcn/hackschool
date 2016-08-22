module Account::PostsHelper

  def render_prev_next_buttons(post)
    may_prev = post.may_prev? 
    may_next = post.may_next?

    render partial: "account/posts/prev_next_buttons", locals: {may_prev: may_prev, may_next: may_next}
    
  end

end

