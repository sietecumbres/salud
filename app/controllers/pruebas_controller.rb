class PruebasController < ApplicationController

  def index
    @pruebas = Prueba.all
  end

  def show
    @prueba = Prueba.find(params[:id])
  end

  def new
    @prueba = Prueba.new
  end

  def edit
    @prueba = Prueba.find(params[:id])
  end

  def create
    @prueba = Prueba.new(params[:prueba])
    if @prueba.save
      redirect_to(@prueba, :notice => 'La Prueba fue creada correctamente.')
    else
      render :action => "new"
    end
  end

  def update
    @prueba = Prueba.find(params[:id])
    if @prueba.update_attributes(params[:prueba])
      redirect_to(@prueba, :notice => 'La Prueba fue actualizada correctamente.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @prueba = Prueba.find(params[:id])
    @prueba.destroy
    redirect_to(pruebas_url)
  end
end
