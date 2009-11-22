class Admin::HomeChecksController < Admin::BaseController
  # GET /home_checks
  # GET /home_checks.xml
  def index
    @home_checks = HomeCheck.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @home_checks }
    end
  end

  # GET /home_checks/1
  # GET /home_checks/1.xml
  def show
    @home_check = HomeCheck.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @home_check }
    end
  end

  # GET /home_checks/new
  # GET /home_checks/new.xml
  def new
    @volunteer = Volunteer.find(params[:volunteer_id])
    @home_check = HomeCheck.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @home_check }
    end
  end

  # GET /home_checks/1/edit
  def edit
    @home_check = HomeCheck.find(params[:id])
  end

  # POST /home_checks
  # POST /home_checks.xml
  def create
    @volunteer = Volunteer.find(params[:volunteer_id])
    @home_check = HomeCheck.new(params[:home_check].merge(:volunteer => @volunteer))

    respond_to do |format|
      if @home_check.save
        flash[:notice] = 'HomeCheck was successfully created.'
        format.html { redirect_to(admin_home_checks_url) }
        format.xml  { render :xml => @home_check, :status => :created, :location => @home_check }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @home_check.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /home_checks/1
  # PUT /home_checks/1.xml
  def update
    @home_check = HomeCheck.find(params[:id])

    respond_to do |format|
      if @home_check.update_attributes(params[:home_check])
        flash[:notice] = 'HomeCheck was successfully updated.'
        format.html { redirect_to(@home_check) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @home_check.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /home_checks/1
  # DELETE /home_checks/1.xml
  def destroy
    @home_check = HomeCheck.find(params[:id])
    @home_check.destroy

    respond_to do |format|
      format.html { redirect_to(home_checks_url) }
      format.xml  { head :ok }
    end
  end
end
