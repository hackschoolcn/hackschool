module Account::QuestionsHelper
  def render_highlight_content(question, query_string)
    excerpt_cont = excerpt(question.title, query_string, radius: 500)
    highlight(excerpt_cont,query_string)
  end
end
