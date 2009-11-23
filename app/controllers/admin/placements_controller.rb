class Admin::PlacementsController < Admin::BaseController

  def index
    @search = PlacementSearch.new(params[:search])
    @volunteers = @search.all#.paginate(:page => params[:page])
  end

end
