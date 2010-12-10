class SubtipoEquiposController < ApplicationController

  def index
    @subtipo_equipos = SubtipoEquipo.all
  end

  def new
    @subtipo_equipo = SubtipoEquipo.new
  end

  def edit
    @subtipo_equipo = SubtipoEquipo.find(params[:id])
  end

  def create
    @subtipo_equipo = SubtipoEquipo.new(params[:subtipo_equipo])
    if @subtipo_equipo.save
      redirect_to subtipo_equipos_url
    else
      render :action => "new"
    end
  end

  def update
    @subtipo_equipo = SubtipoEquipo.find(params[:id])
    if @subtipo_equipo.update_attributes(params[:subtipo_equipo])
      redirect_to subtipo_equipos_url
    else
      render :action => "edit"
    end
  end

  def destroy
    @subtipo_equipo = SubtipoEquipo.find(params[:id])
    @subtipo_equipo.destroy
    redirect_to subtipo_equipos_url
  end
  
end
