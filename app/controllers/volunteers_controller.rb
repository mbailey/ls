class VolunteersController < ApplicationController
  # before_filter :require_no_user, :only => [:new, :create]
  # before_filter :require_user, :except => [:new, :create]

  # GET /volunteers/1
  # GET /volunteers/1.xml
  # def show
  #   @volunteer = Volunteer.find(params[:id])
  # 
  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.xml  { render :xml => @volunteer }
  #   end
  # end

  # GET /volunteers/new
  # GET /volunteers/new.xml
  def new
    @volunteer = Volunteer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @volunteer }
    end
  end

  # GET /volunteers/1/edit
  # def edit
  #   @volunteer = Volunteer.find(params[:id])
  # end

  # POST /volunteers
  # POST /volunteers.xml
  def create
    @volunteer = Volunteer.new(params[:volunteer])

    respond_to do |format|
      if @volunteer.save
        flash[:notice] = 'Submission was accepted.'
        format.html
        format.xml  { render :xml => @volunteer, :status => :created, :location => @volunteer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @volunteer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /volunteers/1
  # PUT /volunteers/1.xml
  # def update
  #   @volunteer = Volunteer.find(params[:id])
  # 
  #   respond_to do |format|
  #     if @volunteer.update_attributes(params[:volunteer])
  #       flash[:notice] = 'Volunteer was successfully updated.'
  #       format.html { redirect_to(@volunteer) }
  #       format.xml  { head :ok }
  #     else
  #       format.html { render :action => "edit" }
  #       format.xml  { render :xml => @volunteer.errors, :status => :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /volunteers/1
  # DELETE /volunteers/1.xml
  # def destroy
  #   @volunteer = Volunteer.find(params[:id])
  #   @volunteer.destroy
  # 
  #   respond_to do |format|
  #     format.html { redirect_to(volunteers_url) }
  #     format.xml  { head :ok }
  #   end
  # end
end
