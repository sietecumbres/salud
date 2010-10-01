class PrestadorMantenimiento < ActiveRecord::Base
  belongs_to :reporte_mantenimiento
  belongs_to :responsable, :class_name => "Persona"
end
