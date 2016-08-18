class PostsController < ApplicationController
  before_action :get_chapter
  before_action :authenticate_user!, only:[:index, :show]

  def get_chapter
    @chapter = Chapter.find(params[:chapter_id])
  end

  def index
    @posts = @chapter.posts
  end

  def show
    @post = @chapter.posts.find(params[:id])
  end
end
