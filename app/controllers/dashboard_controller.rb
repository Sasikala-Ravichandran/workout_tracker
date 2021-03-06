class DashboardController < ApplicationController
  
  def index
    @athletes = User.paginate(page: params[:page], per_page: 10)
  end

  def search
    @athletes = User.search_by_name(params[:search_name]).paginate(page: params[:page], per_page: 10)
  end
end
