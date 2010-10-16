class HojaVidaController < ApplicationController

  before_filter :require_user
  
  def show
    @equipo = Equipo.find(params[:id])
  end

end
