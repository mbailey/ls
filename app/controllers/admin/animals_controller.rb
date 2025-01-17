class Admin::AnimalsController < Admin::BaseController
  
  def invite
    @carers = Carer.all
  end
  
  
  # GET /animals
  # GET /animals.xml
  def index
    @animals = Animal.paginate :page => params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @animals }
    end
  end

  # GET /animals/1
  # GET /animals/1.xml
  def show
    @animal = Animal.find(params[:id])
    if @animal.placement_status == 'seeking_carer'
      @potential_carers = Carer.with_animal_kind(@animal.animal_kind).with_capabilities(@animal.capabilities)
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @animal }
    end
  end

  # GET /animals/new
  # GET /animals/new.xml
  def new
    @animal = Animal.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @animal }
    end
  end

  # GET /animals/1/edit
  def edit
    @animal = Animal.find(params[:id])
  end

  # POST /animals
  # POST /animals.xml
  def create
    @animal = Animal.new(params[:animal])

    respond_to do |format|
      if @animal.save
        flash[:notice] = 'Animal was successfully created.'
        format.html { redirect_to([:admin, @animal]) }
        format.xml  { render :xml => @animal, :status => :created, :location => @animal }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @animal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /animals/1
  # PUT /animals/1.xml
  def update
    @animal = Animal.find(params[:id])

    respond_to do |format|
      if @animal.update_attributes(params[:animal])
        flash[:notice] = 'Animal was successfully updated.'
        format.html { redirect_to([:admin, @animal]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @animal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /animals/1
  # DELETE /animals/1.xml
  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy

    respond_to do |format|
      format.html { redirect_to(admin_animals_url) }
      format.xml  { head :ok }
    end
  end
end
