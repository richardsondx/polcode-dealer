class RedeemsController < ApplicationController
  # GET /redeems
  # GET /redeems.xml
  def index
    @redeems = Redeem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @redeems }
    end
  end

  # GET /redeems/1
  # GET /redeems/1.xml
  def show
    @redeem = Redeem.find(params[:id])
    p @redeem.deal_id
    @deal = Deal.find(@redeem.deal_id)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @redeem }
    end
  end

  # GET /redeems/new
  # GET /redeems/new.xml
  def new
    @redeem = Redeem.new(:deal_id => params[:id])    
  end

  # GET /redeems/1/edit
  def edit
    @redeem = Redeem.find(params[:id])
  end

  # POST /redeems
  # POST /redeems.xml
  def create
    #params[:deal_id] is placed in the url of POST action see routes.rb why
    @redeem = Redeem.new(params[:redeem].merge(:deal_id => params[:deal_id]))
    #alternatively by using association's build method deal_id will be assigned automatically
    #@redeem = Deal.find(params[:deal_id]).redeem.build(params[:redeem])
    
    if @redeem.save
      if @redeem.deal.decrement_price
        redirect_to(@redeem, :notice => 'You got it!')
      end
    else
      render :action => "new"
    end
  end

  # PUT /redeems/1
  # PUT /redeems/1.xml
  def update
    @redeem = Redeem.find(params[:id])

    respond_to do |format|
      if @redeem.update_attributes(params[:redeem])
        format.html { redirect_to(@redeem, :notice => 'Redeem was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @redeem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /redeems/1
  # DELETE /redeems/1.xml
  def destroy
    @redeem = Redeem.find(params[:id])
    @redeem.destroy

    respond_to do |format|
      format.html { redirect_to(redeems_url) }
      format.xml  { head :ok }
    end
  end
end
