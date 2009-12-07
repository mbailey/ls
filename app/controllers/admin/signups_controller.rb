class Admin::SignupsController < Admin::BaseController

  # GET /signups
  # GET /signups.xml
  def index
    # @signups = Signup.find(:all)
    # @signups = Signup.paginate_by_board_id @board.id, :page => params[:page], :order => 'updated_at DESC'
    @signups = Signup.pending.paginate :page => params[:page], :order => 'status, id'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @signups }
      format.csv  { send_data(Signup.generate_csv(@signups), :type => 'text/csv; charset=utf-8; header=present', :filename => "all_signups.csv")
      }
    end
  end
  
  # def pending
  #   @signups = Signup.pending.paginate :page => params[:page], :order => 'status, id'
  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.xml  { render :xml => @signups }
  #     format.csv  { send_data(Signup.generate_csv(@signups), :type => 'text/csv; charset=utf-8; header=present', :filename => "all_signups.csv")
  #     }
  #   end
  # end
  
  def map
    @signups = Signup.find(:all)
    respond_to do |format|
      format.html {render :layout => false}
    end
  end

  def search
    if params['address']
      @signups = Signup.can_keep_dogs(params['can_keep_dogs']).hours_at_home(params['hours_at_home']).find(:all, :origin => "#{params['address']}, australia", :within => params['within'], :order => :distance).paginate :page => params[:page]
    end
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /signups/1
  # GET /signups/1.xml
  def show
    @signup = Signup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @signup }
    end
  end

  # GET /signups/new
  # GET /signups/new.xml
  def new
    @signup = Signup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @signup }
    end
  end

  # GET /signups/1/edit
  def edit
    @signup = Signup.find(params[:id])
  end

  # POST /signups
  # POST /signups.xml
  def create
    @signup = Signup.new(params[:signup])

    respond_to do |format|
      if @signup.save
        flash[:notice] = 'Submission was accepted.'
        format.html
        format.xml  { render :xml => @signup, :status => :created, :location => @signup }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @signup.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /signups/1
  # PUT /signups/1.xml
  def update
    @signup = Signup.find(params[:id])

    respond_to do |format|
      if @signup.update_attributes(params[:signup])
        flash[:notice] = 'Signup was successfully updated.'
        format.html { redirect_to([:admin, @signup]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @signup.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /signups/1
  # DELETE /signups/1.xml
  def destroy
    @signup = Signup.find(params[:id])
    @signup.destroy

    respond_to do |format|
      format.html { redirect_to(signups_url) }
      format.xml  { head :ok }
    end
  end
end
