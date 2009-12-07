class SignupsController < ApplicationController
  # before_filter :require_no_user, :only => [:new, :create]
  # before_filter :require_user, :except => [:new, :create]

  # GET /signups/1
  # GET /signups/1.xml
  # def show
  #   @signup = Signup.find(params[:id])
  # 
  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.xml  { render :xml => @signup }
  #   end
  # end

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
  # def edit
  #   @signup = Signup.find(params[:id])
  # end

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
  # def update
  #   @signup = Signup.find(params[:id])
  # 
  #   respond_to do |format|
  #     if @signup.update_attributes(params[:signup])
  #       flash[:notice] = 'Signup was successfully updated.'
  #       format.html { redirect_to(@signup) }
  #       format.xml  { head :ok }
  #     else
  #       format.html { render :action => "edit" }
  #       format.xml  { render :xml => @signup.errors, :status => :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /signups/1
  # DELETE /signups/1.xml
  # def destroy
  #   @signup = Signup.find(params[:id])
  #   @signup.destroy
  # 
  #   respond_to do |format|
  #     format.html { redirect_to(signups_url) }
  #     format.xml  { head :ok }
  #   end
  # end
end
