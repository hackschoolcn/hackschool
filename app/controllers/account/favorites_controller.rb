class Account::FavoritesController < ApplicationController
  def index
    @courses = current_user.favorite_courses
  end
end
