module Account::QuestionsHelper
  def render_highlight_content(question, query_string)
    excerpt_cont = excerpt(question.title, query_string, radius: 500)
    highlight(excerpt_cont,query_string)
  end

  def render_question_description_highlight_content(question, query_string)
    excerpt_cont = excerpt(question.description, query_string, radius: 500)
    highlight(excerpt_cont,query_string)
  end

  def render_answer_content_highlight_content(answer, query_string)
    excerpt_cont = excerpt(answer.content, query_string, radius: 500)
    highlight(excerpt_cont,query_string)
  end
end
