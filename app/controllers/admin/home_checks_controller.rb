class Admin::HomeChecksController < Admin::BaseController
  # GET /home_checks
  # GET /home_checks.xml
  def index
    @home_checks = HomeCheck.all :order => :scheduled_at
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @home_checks }
    end
  end
  
  # GET /home_checks/index_for_date?date=...
  def index_for_date
    @date = Time.zone.parse(params[:date])
    @home_checks = HomeCheck.on_date(@date)
    render :partial => "index_for_date", :layout => false
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
    @signup = Signup.find(params[:signup_id])
    @date = Time.zone.now.beginning_of_day
    @home_check = HomeCheck.new(:scheduled_at_date => @date, :scheduled_at_time => "9:00")
    @home_checks = HomeCheck.on_date(@date)

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
    @signup = Signup.find(params[:signup_id])
    @home_check = HomeCheck.new(params[:home_check].merge(:signup => @signup, :booked_by => current_user))

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
        format.html { redirect_to(admin_home_checks_url) }
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
