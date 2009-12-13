class Admin::CapabilitiesController < Admin::BaseController
  # GET /capabilities
  # GET /capabilities.xml
  def index
    @capabilities = Capability.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @capabilities }
    end
  end

  # GET /capabilities/1
  # GET /capabilities/1.xml
  def show
    @capability = Capability.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @capability }
    end
  end

  # GET /capabilities/new
  # GET /capabilities/new.xml
  def new
    @capability = Capability.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @capability }
    end
  end

  # GET /capabilities/1/edit
  def edit
    @capability = Capability.find(params[:id])
  end

  # POST /capabilities
  # POST /capabilities.xml
  def create
    @capability = Capability.new(params[:capability])

    respond_to do |format|
      if @capability.save
        flash[:notice] = 'Capability was successfully created.'
        format.html { redirect_to([:admin, @capability]) }
        format.xml  { render :xml => @capability, :status => :created, :location => @capability }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @capability.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /capabilities/1
  # PUT /capabilities/1.xml
  def update
    @capability = Capability.find(params[:id])

    respond_to do |format|
      if @capability.update_attributes(params[:capability])
        flash[:notice] = 'Capability was successfully updated.'
        format.html { redirect_to([:admin, @capability]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @capability.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /capabilities/1
  # DELETE /capabilities/1.xml
  def destroy
    @capability = Capability.find(params[:id])
    @capability.destroy

    respond_to do |format|
      format.html { redirect_to(admin_capabilities_url) }
      format.xml  { head :ok }
    end
  end
end
