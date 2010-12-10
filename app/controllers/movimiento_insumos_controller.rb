class MovimientoInsumosController < ApplicationController

  before_filter :require_user
  
  def entrada
    @movimiento_insumo = MovimientoInsumo.new
    @tipo_movimiento = TipoMovimiento.find_by_nombre("Entrada")
  end

  def crear_entrada
    @movimiento_insumo = MovimientoInsumo.new(params[:movimiento_insumo])
    @insumo = Insumo.new(params[:insumo].merge(:tipo_insumo_id => params[:tipo_insumo]))
    redirect_to :action => "entrada" if @movimiento_insumo.save && @insumo.save
  end

  def salida
    @movimiento_insumo = MovimientoInsumo.new
    @tipo_movimiento = TipoMovimiento.find_by_nombre("Salida")
  end

  def crear_salida
    @movimiento_insumo = MovimientoInsumo.new(params[:movimiento_insumo])
    @insumos = TipoInsumo.find(params[:tipo_insumo])

#    "tipo_insumo"=>"1"
#      "movimiento_insumo"=>{"laboratorio_id"=>"1",
#      "unidad"=>"cm3",
#      "area_id"=>"1",
#      "tipo_movimiento_id"=>"2",
#      "cantidad"=>"100",
#      "fecha"=>"30/11/2010"}
  end

end
