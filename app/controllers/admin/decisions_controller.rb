class Admin::DecisionsController < Admin::BaseController

  def edit
    @signup = Signup.find(params[:signup_id])
  end
  
  def update
    @signup = Signup.find(params[:signup_id])
    @signup.update_attributes params[:signup] # Catch errors
    @signup.decided_by = current_user
    @signup.decided_on = Time.now

    if @signup.status == 'approved'
      @signup.carer = Carer.new
      @signup.carer.update_attributes(@signup.attributes.reject{|k,v| %w(decided_on decided_by decided_notes status carer_id).include? k})
    end
    
    respond_to do |format|
      if @signup.save
        flash[:notice] = "Carer Application was #{@signup.status}."
        format.html { redirect_to(admin_signups_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @signup.errors, :status => :unprocessable_entity }
      end
    end
    
  end 

end