class TipoInsumosController < ApplicationController

  before_filter :require_user
  
  # GET /tipo_insumos
  # GET /tipo_insumos.xml
  def index
    @tipo_insumos = TipoInsumo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tipo_insumos }
    end
  end

  # GET /tipo_insumos/1
  # GET /tipo_insumos/1.xml
  def show
    @tipo_insumo = TipoInsumo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tipo_insumo }
    end
  end

  # GET /tipo_insumos/new
  # GET /tipo_insumos/new.xml
  def new
    @tipo_insumo = TipoInsumo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tipo_insumo }
    end
  end

  # GET /tipo_insumos/1/edit
  def edit
    @tipo_insumo = TipoInsumo.find(params[:id])
  end

  # POST /tipo_insumos
  # POST /tipo_insumos.xml
  def create
    @tipo_insumo = TipoInsumo.new(params[:tipo_insumo])

    respond_to do |format|
      if @tipo_insumo.save
        format.html { redirect_to(@tipo_insumo, :notice => 'Tipo insumo was successfully created.') }
        format.xml  { render :xml => @tipo_insumo, :status => :created, :location => @tipo_insumo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tipo_insumo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tipo_insumos/1
  # PUT /tipo_insumos/1.xml
  def update
    @tipo_insumo = TipoInsumo.find(params[:id])

    respond_to do |format|
      if @tipo_insumo.update_attributes(params[:tipo_insumo])
        format.html { redirect_to(@tipo_insumo, :notice => 'Tipo insumo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tipo_insumo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_insumos/1
  # DELETE /tipo_insumos/1.xml
  def destroy
    @tipo_insumo = TipoInsumo.find(params[:id])
    @tipo_insumo.destroy

    respond_to do |format|
      format.html { redirect_to(tipo_insumos_url) }
      format.xml  { head :ok }
    end
  end
end
