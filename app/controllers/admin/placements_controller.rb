class Admin::PlacementsController < Admin::BaseController

  def search
    @search = PlacementSearch.new(params[:search])
    @volunteers = @search.all#.paginate(:page => params[:page])
  end
  
  def index
    @placements = Placement.all
  end
  
  def show
    @placement = Placement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @home_check }
    end
  end
  
  def new
    @placement = Placement.new
  end
  
  def create
    @placement = Placement.new(params[:placement])

    respond_to do |format|
      if @placement.save
        flash[:notice] = 'Placement was successfully created.'
        format.html { redirect_to([:admin, @placement]) }
        format.xml  { render :xml => @placement, :status => :created, :location => @placement }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @placement.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @placement = Placement.find(params[:id])
  end
  
  def update
    @placement = Placement.find(params[:id])

    respond_to do |format|
      if @placement.update_attributes(params[:placement])
        flash[:notice] = 'Placement was successfully updated.'
        format.html { redirect_to([:admin, @placement]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @placement.errors, :status => :unprocessable_entity }
      end
    end
  end

end
