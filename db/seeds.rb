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