class AlmacenamientosController < ApplicationController

  def index
    @almacenamientos = Almacenamiento.all
  end

  def show
    @almacenamiento = Almacenamiento.find(params[:id])
  end

  def new
    @almacenamiento = Almacenamiento.new
  end

  def edit
    @almacenamiento = Almacenamiento.find(params[:id])
  end

  def create
    @almacenamiento = Almacenamiento.new(params[:almacenamiento])
    if @almacenamiento.save
      redirect_to(@almacenamiento, :notice => 'Almacenamiento was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @almacenamiento = Almacenamiento.find(params[:id])
    if @almacenamiento.update_attributes(params[:almacenamiento])
      redirect_to(@almacenamiento, :notice => 'Almacenamiento was successfully updated.')
    else
      render :action => "edit"
    end

  end

  def destroy
    @almacenamiento = Almacenamiento.find(params[:id])
    @almacenamiento.destroy
    redirect_to(almacenamientos_url)
  end
  
end
