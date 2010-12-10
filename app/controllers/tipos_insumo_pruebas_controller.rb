class TiposInsumoPruebasController < ApplicationController

  before_filter :require_user
  
  def index
    @tipos_insumo_pruebas = TiposInsumoPrueba.all
  end

  def show
    @tipos_insumo_prueba = TiposInsumoPrueba.find(params[:id])
  end

  def new
    @tipos_insumo_prueba = TiposInsumoPrueba.new
  end

  def edit
    @tipos_insumo_prueba = TiposInsumoPrueba.find(params[:id])
  end

  def create
    @tipos_insumo_prueba = TiposInsumoPrueba.new(params[:tipos_insumo_prueba])
    if @tipos_insumo_prueba.save
      redirect_to(@tipos_insumo_prueba)
    else
      render :action => "new"
    end
  end

  def update
    @tipos_insumo_prueba = TiposInsumoPrueba.find(params[:id])
    if @tipos_insumo_prueba.update_attributes(params[:tipos_insumo_prueba])
      redirect_to(@tipos_insumo_prueba)
    else
      render :action => "edit"
    end
  end

  def destroy
    @tipos_insumo_prueba = TiposInsumoPrueba.find(params[:id])
    @tipos_insumo_prueba.destroy
    redirect_to(tipos_insumo_pruebas_url)
  end
end
