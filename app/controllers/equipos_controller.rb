class EquiposController < ApplicationController
  def index
    @equipos = Equipo.all
  end

end
