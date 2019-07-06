class SchoolsController < ApplicationController
  def index
    @schools = School.all
  end

  def show
    @school = School.find(params[:id])
    redirect_to school_vendors_path(@school)
  end
end
