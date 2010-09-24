# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

tipo = TipoEquipo.create({:nombre => 'Tipo 1'})
subtipo = SubtipoEquipo.create({:nombre => 'Subtipo 1'})
adquisicion = TipoAdquisicion.create({:nombre => 'Adquisicion 1'})
persona = Persona.create({:nombre => 'Persona 1'})

equipo = Equipo.new
equipo.tipo_equipo_id = tipo.id
equipo.subtipo_equipo_id = subtipo.id
equipo.modelo = 'aaa'
equipo.marca = 'bbb'
equipo.serial = '12345'
equipo.placa = 'abc123'
equipo.tipo_adquisicion_id = TipoAdquisicion.first.id
equipo.valor = 1
equipo.responsable_id = persona.id
equipo.save

fabricante = Fabricante.create({:nombre => 'Bayer'})
proveedor = Proveedor.create({:nombre => 'F&G'})

hojavida = HojaVida.new
hojavida.amperaje = 0.85
hojavida.equipo_id = equipo.id
hojavida.fabricante_id = fabricante.id
hojavida.fecha_compra = Date.new(2000, 02, 25)
hojavida.fecha_instalacion = '2002/05/12'
hojavida.frecuencia = 4.67
hojavida.garantia = '2012/05/12'
hojavida.manual_operacion = 'Si'
hojavida.potencia = 67.23
hojavida.proveedor_id = proveedor.id
hojavida.voltaje = 110
hojavida.save