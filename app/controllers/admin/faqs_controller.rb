class Admin::FaqsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin
  layout "admin"

  def index
    @faqs = Faq.all
  end

  def new
    @faq = Faq.new
  end

  def show
    @faq = Faq.find(params[:id])
  end

  def edit
    @faq = Faq.find(params[:id])
  end

  def create
    @faq = Faq.new(faq_params)
  if @faq.save
    redirect_to admin_faqs_path, notice: "Created Success"
  else
    render :new
  end
end

  def update
    @faq = Faq.find(params[:id])
  if @faq.update(faq_params)
    redirect_to admin_faqs_path, notice: "Updated Success"
  else
    render :edit
  end
end

  def destroy
    @faq = Faq.find(params[:id])
    @faq.destroy
    redirect_to admin_faqs_path, alert: "Deleted"
  end

  private

  def faq_params
    params.require(:faq).permit(:title, :description)
  end
end
