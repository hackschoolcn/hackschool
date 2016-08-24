class Account::FaqsController < ApplicationController
  before_action :authenticate_user!
  def index
    @faqs = Faq.all
  end

  def show
    @faq = Faq.find(params[:id])
  end
end
