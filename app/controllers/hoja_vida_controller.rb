class HojaVidaController < ApplicationController
  def show
    @equipo = Equipo.find(params[:id])
    @equipo
  end

end
