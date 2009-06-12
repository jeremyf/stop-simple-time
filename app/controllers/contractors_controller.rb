class ContractorsController < ApplicationController
  def index
    @contractors = Contractor.find(:all)

    respond_to do |format|
      format.html
      format.xml  { render :xml => @contractors }
    end
  end

  def show
    @contractor = Contractor.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @contractor }
    end
  end

  def new
    @contractor = Contractor.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @contractor }
    end
  end

  def edit
    @contractor = Contractor.find(params[:id])
  end

  def create
    @contractor = Contractor.new(params[:contractor])

    respond_to do |format|
      if @contractor.save
        flash[:notice] = 'Contractor was successfully created.'
        format.html { redirect_to(@contractor) }
        format.xml  { render :xml => @contractor, :status => :created, :location => @contractor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contractor.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @contractor = Contractor.find(params[:id])

    respond_to do |format|
      if @contractor.update_attributes(params[:contractor])
        flash[:notice] = 'Contractor was successfully updated.'
        format.html { redirect_to(@contractor) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contractor.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @contractor = Contractor.find(params[:id])
    @contractor.destroy

    respond_to do |format|
      format.html { redirect_to(contractors_url) }
      format.xml  { head :ok }
    end
  end
end
