class Repuesto < ActiveRecord::Base
  has_many :repuesto_equipos
end
