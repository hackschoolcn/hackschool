class Admin::SectionsController < ApplicationController
  def index
    @sections = Section.all
  end

  def new
    @section = Section.new
  end

  def edit
    @section = Section.find(params[:id])
  end

  def show
    @section = Section.find(params[:id])
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      redirect_to admin_sections_path, notice: "hahaha"
    else
      render :new
    end
  end

  def update
    @section = Section.find(params[:id])
    if @section.update(section_params)
      redirect_to root_path, notice: "hahaha"
    else
      render :edit
    end
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    redirect_to  admin_sections_path, alert: "Deleted"
  end

  private

  def section_params
    params.require(:section).permit(:section)
  end
end
