class KardexController < ApplicationController
  def index
		@insumos = TipoInsumo.all
  end

  def show
  end

end
