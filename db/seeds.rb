# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

adquisicion = TipoAdquisicion.new
adquisicion.nombre = 'Comodato'
adquisicion.save
adquisicion1 = TipoAdquisicion.new
adquisicion1.nombre = 'Propiedad por compra'
adquisicion1.save
adquisicion2 = TipoAdquisicion.new
adquisicion2.nombre = 'Leasing'
adquisicion2.save
adquisicion3 = TipoAdquisicion.new
adquisicion3.nombre = 'Arriendo'
adquisicion3.save

tipo_equipo = TipoEquipo.new
tipo_equipo.nombre = 'Alto riesgo'
tipo_equipo.save
tipo_equipo1 = TipoEquipo.new
tipo_equipo1.nombre = 'Riesgo moderado'
tipo_equipo1.save
tipo_equipo2 = TipoEquipo.new
tipo_equipo2.nombre = 'Bajo riesgo'
tipo_equipo2.save

subtipo_equipo = SubtipoEquipo.new
subtipo_equipo.nombre = 'Subtipo 1'
subtipo_equipo.save
subtipo_equipo1 = SubtipoEquipo.new
subtipo_equipo1.nombre = 'Subtipo 2'
subtipo_equipo1.save
subtipo_equipo2 = SubtipoEquipo.new
subtipo_equipo2.nombre = 'Subtipo 3'
subtipo_equipo2.save

persona = Persona.create({:nombre => 'Persona 1'})

equipo = Equipo.new
equipo.tipo_equipo_id = tipo_equipo.id
equipo.subtipo_equipo_id = subtipo_equipo.id
equipo.modelo = 'aaa'
equipo.marca = 'bbb'
equipo.serial = '12345'
equipo.placa = 'abc123'
equipo.tipo_adquisicion_id = adquisicion.id
equipo.valor = 1
equipo.responsable_id = persona.id
equipo.save
equipo1 = Equipo.new
equipo1.tipo_equipo_id = tipo_equipo1.id
equipo1.subtipo_equipo_id = subtipo_equipo1.id
equipo1.modelo = 'bbb'
equipo1.marca = 'ccc'
equipo1.serial = '67890'
equipo1.placa = 'def456'
equipo1.tipo_adquisicion_id = adquisicion.id
equipo1.valor = 100
equipo1.responsable_id = persona.id
equipo1.save

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
hojavida1 = HojaVida.new
hojavida1.amperaje = 0.85
hojavida1.equipo_id = equipo1.id
hojavida1.fabricante_id = fabricante.id
hojavida1.fecha_compra = Date.new(2000, 02, 25)
hojavida1.fecha_instalacion = '2002/05/12'
hojavida1.frecuencia = 4.67
hojavida1.garantia = '2012/05/12'
hojavida1.manual_operacion = 'Si'
hojavida1.potencia = 67.23
hojavida1.proveedor_id = proveedor.id
hojavida1.voltaje = 110
hojavida1.save