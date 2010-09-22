class Equipo < ActiveRecord::Base
  belongs_to :area
  belongs_to :persona
  belongs_to :subtipo_equipo
  belongs_to :tipo_adquisicion
  belongs_to :tipo_equipo
  has_one :hoja_vida
  has_many :estado_equipos
  has_many :movimientos
  has_many :reporte_mantenimientos
  has_many :repuesto_equipos
end
