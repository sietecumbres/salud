class PrestadorMantenimiento < ActiveRecord::Base
  has_many :entrega_mantenimientos
end
