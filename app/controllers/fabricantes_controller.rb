class FabricantesController < ApplicationController

  def index
    @fabricantes = Fabricante.all
  end

  def new
    @fabricante = Fabricante.new
  end

  def edit
    @fabricante = Fabricante.find(params[:id])
  end

  def create
    @fabricante = Fabricante.new(params[:fabricante])
    if @fabricante.save
      redirect_to fabricantes_url
    else
      render :action => "new"
    end
  end

  def update
    @fabricante = Fabricante.find(params[:id])
    if @fabricante.update_attributes(params[:fabricante])
      redirect_to fabricantes_url
    else
      render :action => "edit"
    end
  end

  def destroy
    @fabricante = Fabricante.find(params[:id])
    @fabricante.destroy
    redirect_to fabricantes_url
  end
end
