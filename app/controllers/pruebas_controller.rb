class PruebasController < ApplicationController
  # GET /pruebas
  # GET /pruebas.xml
  def index
    @pruebas = Prueba.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pruebas }
    end
  end

  # GET /pruebas/1
  # GET /pruebas/1.xml
  def show
    @prueba = Prueba.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @prueba }
    end
  end

  # GET /pruebas/new
  # GET /pruebas/new.xml
  def new
    @prueba = Prueba.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @prueba }
    end
  end

  # GET /pruebas/1/edit
  def edit
    @prueba = Prueba.find(params[:id])
  end

  # POST /pruebas
  # POST /pruebas.xml
  def create
    @prueba = Prueba.new(params[:prueba])

    respond_to do |format|
      if @prueba.save
        format.html { redirect_to(@prueba, :notice => 'Prueba was successfully created.') }
        format.xml  { render :xml => @prueba, :status => :created, :location => @prueba }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @prueba.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pruebas/1
  # PUT /pruebas/1.xml
  def update
    @prueba = Prueba.find(params[:id])

    respond_to do |format|
      if @prueba.update_attributes(params[:prueba])
        format.html { redirect_to(@prueba, :notice => 'Prueba was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @prueba.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pruebas/1
  # DELETE /pruebas/1.xml
  def destroy
    @prueba = Prueba.find(params[:id])
    @prueba.destroy

    respond_to do |format|
      format.html { redirect_to(pruebas_url) }
      format.xml  { head :ok }
    end
  end
end
