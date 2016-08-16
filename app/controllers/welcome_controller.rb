class WelcomeController < ApplicationController

  def index
    flash[:alert]= "你好！"
  end
end
