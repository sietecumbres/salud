class HojaVida < ActiveRecord::Base
  belongs_to :equipo
  belongs_to :fabricante
  belongs_to :proveedor
end
