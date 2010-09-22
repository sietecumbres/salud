class Estado < ActiveRecord::Base
  has_many :estado_equipos
end:through => :appointments 
