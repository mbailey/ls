class CarersController < ApplicationController
  # before_filter :require_no_user, :only => [:new, :create]
  # before_filter :require_user, :except => [:new, :create]

  # GET /carers/1
  # GET /carers/1.xml
  # def show
  #   @carer = Carer.find(params[:id])
  # 
  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.xml  { render :xml => @carer }
  #   end
  # end

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
  # def edit
  #   @carer = Carer.find(params[:id])
  # end

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
  # def update
  #   @carer = Carer.find(params[:id])
  # 
  #   respond_to do |format|
  #     if @carer.update_attributes(params[:carer])
  #       flash[:notice] = 'Carer was successfully updated.'
  #       format.html { redirect_to(@carer) }
  #       format.xml  { head :ok }
  #     else
  #       format.html { render :action => "edit" }
  #       format.xml  { render :xml => @carer.errors, :status => :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /carers/1
  # DELETE /carers/1.xml
  # def destroy
  #   @carer = Carer.find(params[:id])
  #   @carer.destroy
  # 
  #   respond_to do |format|
  #     format.html { redirect_to(carers_url) }
  #     format.xml  { head :ok }
  #   end
  # end
end
