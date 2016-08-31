class Account::FavoritesController < AccountController
  def index
    @courses = current_user.favorite_courses
  end
end
