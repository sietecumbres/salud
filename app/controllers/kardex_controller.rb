class KardexController < ApplicationController
  def index
		@insumos = TipoInsumo.all
  end

  def show
		@insumo = TipoInsumo.where(:id => params[:id]).first
		@movimientos = MovimientoInsumo.get_transactions(@insumo)
		@balance = MovimientoInsumo.get_balance(@insumo)
  end

end
