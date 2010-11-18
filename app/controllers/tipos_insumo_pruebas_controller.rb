class TiposInsumoPruebasController < ApplicationController
  # GET /tipos_insumo_pruebas
  # GET /tipos_insumo_pruebas.xml
  def index
    @tipos_insumo_pruebas = TiposInsumoPrueba.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tipos_insumo_pruebas }
    end
  end

  # GET /tipos_insumo_pruebas/1
  # GET /tipos_insumo_pruebas/1.xml
  def show
    @tipos_insumo_prueba = TiposInsumoPrueba.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tipos_insumo_prueba }
    end
  end

  # GET /tipos_insumo_pruebas/new
  # GET /tipos_insumo_pruebas/new.xml
  def new
    @tipos_insumo_prueba = TiposInsumoPrueba.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tipos_insumo_prueba }
    end
  end

  # GET /tipos_insumo_pruebas/1/edit
  def edit
    @tipos_insumo_prueba = TiposInsumoPrueba.find(params[:id])
  end

  # POST /tipos_insumo_pruebas
  # POST /tipos_insumo_pruebas.xml
  def create
    @tipos_insumo_prueba = TiposInsumoPrueba.new(params[:tipos_insumo_prueba])

    respond_to do |format|
      if @tipos_insumo_prueba.save
        format.html { redirect_to(@tipos_insumo_prueba, :notice => 'Tipos insumo prueba was successfully created.') }
        format.xml  { render :xml => @tipos_insumo_prueba, :status => :created, :location => @tipos_insumo_prueba }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tipos_insumo_prueba.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tipos_insumo_pruebas/1
  # PUT /tipos_insumo_pruebas/1.xml
  def update
    @tipos_insumo_prueba = TiposInsumoPrueba.find(params[:id])

    respond_to do |format|
      if @tipos_insumo_prueba.update_attributes(params[:tipos_insumo_prueba])
        format.html { redirect_to(@tipos_insumo_prueba, :notice => 'Tipos insumo prueba was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tipos_insumo_prueba.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tipos_insumo_pruebas/1
  # DELETE /tipos_insumo_pruebas/1.xml
  def destroy
    @tipos_insumo_prueba = TiposInsumoPrueba.find(params[:id])
    @tipos_insumo_prueba.destroy

    respond_to do |format|
      format.html { redirect_to(tipos_insumo_pruebas_url) }
      format.xml  { head :ok }
    end
  end
end
