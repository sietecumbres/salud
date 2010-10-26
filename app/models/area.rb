class Area < ActiveRecord::Base
  has_many :equipos
	belongs_to :laboratorio
end
