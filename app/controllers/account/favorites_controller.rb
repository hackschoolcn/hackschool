class Account::FavoritesController < AccountController
  def index
    @courses = current_user.favorite_courses
    set_page_title "我的收藏"
    set_page_description "加油加油"
  end
end
