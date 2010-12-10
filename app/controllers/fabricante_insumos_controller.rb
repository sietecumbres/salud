class FabricanteInsumosController < ApplicationController

  before_filter :require_user

  def index
    @fabricante_insumos = FabricanteInsumo.all
  end

  def show
    @fabricante_insumo = FabricanteInsumo.find(params[:id])
  end

  def new
    @fabricante_insumo = FabricanteInsumo.new
  end

  def edit
    @fabricante_insumo = FabricanteInsumo.find(params[:id])
  end

  def create
    @fabricante_insumo = FabricanteInsumo.new(params[:fabricante_insumo])
    if @fabricante_insumo.save
      redirect_to(@fabricante_insumo, :notice => 'Fabricante de insumo fué creado correctamente.')
    else
      render :action => "new"
    end
  end

  def update
    @fabricante_insumo = FabricanteInsumo.find(params[:id])

    if @fabricante_insumo.update_attributes(params[:fabricante_insumo])
      redirect_to(@fabricante_insumo, :notice => 'Fabricante de insumo fue actulizado correctamente.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @fabricante_insumo = FabricanteInsumo.find(params[:id])
    @fabricante_insumo.destroy
    redirect_to(fabricante_insumos_url)
  end
end
