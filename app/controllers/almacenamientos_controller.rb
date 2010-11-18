class AlmacenamientosController < ApplicationController
  # GET /almacenamientos
  # GET /almacenamientos.xml
  def index
    @almacenamientos = Almacenamiento.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @almacenamientos }
    end
  end

  # GET /almacenamientos/1
  # GET /almacenamientos/1.xml
  def show
    @almacenamiento = Almacenamiento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @almacenamiento }
    end
  end

  # GET /almacenamientos/new
  # GET /almacenamientos/new.xml
  def new
    @almacenamiento = Almacenamiento.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @almacenamiento }
    end
  end

  # GET /almacenamientos/1/edit
  def edit
    @almacenamiento = Almacenamiento.find(params[:id])
  end

  # POST /almacenamientos
  # POST /almacenamientos.xml
  def create
    @almacenamiento = Almacenamiento.new(params[:almacenamiento])

    respond_to do |format|
      if @almacenamiento.save
        format.html { redirect_to(@almacenamiento, :notice => 'Almacenamiento was successfully created.') }
        format.xml  { render :xml => @almacenamiento, :status => :created, :location => @almacenamiento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @almacenamiento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /almacenamientos/1
  # PUT /almacenamientos/1.xml
  def update
    @almacenamiento = Almacenamiento.find(params[:id])

    respond_to do |format|
      if @almacenamiento.update_attributes(params[:almacenamiento])
        format.html { redirect_to(@almacenamiento, :notice => 'Almacenamiento was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @almacenamiento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /almacenamientos/1
  # DELETE /almacenamientos/1.xml
  def destroy
    @almacenamiento = Almacenamiento.find(params[:id])
    @almacenamiento.destroy

    respond_to do |format|
      format.html { redirect_to(almacenamientos_url) }
      format.xml  { head :ok }
    end
  end
end
