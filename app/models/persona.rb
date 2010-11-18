class Persona < User
  has_many :equipos
	has_many :movimiento_insumos
end
