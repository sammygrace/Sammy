class SchoolsController < ApplicationController
  def index
    @schools = School.all
  end

  def show
  end
end
