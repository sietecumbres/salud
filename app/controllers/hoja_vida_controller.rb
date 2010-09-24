class HojaVidaController < ApplicationController
  def show
    @equipo = Equipo.find(params[:id])
  end

end
