class ProveedorInsumosController < ApplicationController
  # GET /proveedor_insumos
  # GET /proveedor_insumos.xml
  def index
    @proveedor_insumos = ProveedorInsumo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @proveedor_insumos }
    end
  end

  # GET /proveedor_insumos/1
  # GET /proveedor_insumos/1.xml
  def show
    @proveedor_insumo = ProveedorInsumo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @proveedor_insumo }
    end
  end

  # GET /proveedor_insumos/new
  # GET /proveedor_insumos/new.xml
  def new
    @proveedor_insumo = ProveedorInsumo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @proveedor_insumo }
    end
  end

  # GET /proveedor_insumos/1/edit
  def edit
    @proveedor_insumo = ProveedorInsumo.find(params[:id])
  end

  # POST /proveedor_insumos
  # POST /proveedor_insumos.xml
  def create
    @proveedor_insumo = ProveedorInsumo.new(params[:proveedor_insumo])

    respond_to do |format|
      if @proveedor_insumo.save
        format.html { redirect_to(@proveedor_insumo, :notice => 'Proveedor insumo was successfully created.') }
        format.xml  { render :xml => @proveedor_insumo, :status => :created, :location => @proveedor_insumo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @proveedor_insumo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /proveedor_insumos/1
  # PUT /proveedor_insumos/1.xml
  def update
    @proveedor_insumo = ProveedorInsumo.find(params[:id])

    respond_to do |format|
      if @proveedor_insumo.update_attributes(params[:proveedor_insumo])
        format.html { redirect_to(@proveedor_insumo, :notice => 'Proveedor insumo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @proveedor_insumo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /proveedor_insumos/1
  # DELETE /proveedor_insumos/1.xml
  def destroy
    @proveedor_insumo = ProveedorInsumo.find(params[:id])
    @proveedor_insumo.destroy

    respond_to do |format|
      format.html { redirect_to(proveedor_insumos_url) }
      format.xml  { head :ok }
    end
  end
end
