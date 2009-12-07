class Admin::CarersController < Admin::BaseController

  def map
    @carers = Carer.find(:all)
    respond_to do |format|
      format.html {render :layout => false}
    end
  end

  # GET /carers
  # GET /carers.xml
  def index
    # @carers = Carer.find(:all)
    # @carers = Carer.paginate_by_board_id @board.id, :page => params[:page], :order => 'updated_at DESC'
    @carers = Carer.paginate :page => params[:page], :order => 'status, id'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @carers }
      format.csv  { send_data(Carer.generate_csv(@carers), :type => 'text/csv; charset=utf-8; header=present', :filename => "all_carers.csv")
      }
    end
  end
  
  def pending
    @carers = Carer.pending.paginate :page => params[:page], :order => 'status, id'
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @carers }
      format.csv  { send_data(Carer.generate_csv(@carers), :type => 'text/csv; charset=utf-8; header=present', :filename => "all_carers.csv")
      }
    end
  end

  def search
    if params['address']
      @carers = Carer.can_keep_dogs(params['can_keep_dogs']).hours_at_home(params['hours_at_home']).find(:all, :origin => "#{params['address']}, australia", :within => params['within'], :order => :distance).paginate :page => params[:page]
    end
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /carers/1
  # GET /carers/1.xml
  def show
    @carer = Carer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @carer }
    end
  end

  # GET /carers/new
  # GET /carers/new.xml
  def new
    @carer = Carer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @carer }
    end
  end

  # GET /carers/1/edit
  def edit
    @carer = Carer.find(params[:id])
  end

  # POST /carers
  # POST /carers.xml
  def create
    @carer = Carer.new(params[:carer])

    respond_to do |format|
      if @carer.save
        flash[:notice] = 'Submission was accepted.'
        format.html
        format.xml  { render :xml => @carer, :status => :created, :location => @carer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @carer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /carers/1
  # PUT /carers/1.xml
  def update
    @carer = Carer.find(params[:id])

    respond_to do |format|
      if @carer.update_attributes(params[:carer])
        flash[:notice] = 'Carer was successfully updated.'
        format.html { redirect_to([:admin, @carer]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @carer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /carers/1
  # DELETE /carers/1.xml
  def destroy
    @carer = Carer.find(params[:id])
    @carer.destroy

    respond_to do |format|
      format.html { redirect_to(carers_url) }
      format.xml  { head :ok }
    end
  end
end
