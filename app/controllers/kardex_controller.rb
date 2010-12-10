class KardexController < ApplicationController

  before_filter :require_user
  
  def index
		@insumos = TipoInsumo.all
  end

  def show
		@insumo = TipoInsumo.where(:id => params[:id]).first
		@movimientos = MovimientoInsumo.get_transactions(@insumo)
		@balance = MovimientoInsumo.get_balance(@insumo)
  end

end
