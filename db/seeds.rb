# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

area = Area.new
area.nombre = 'Radiología'
area.save
area1 = Area.new
area1.nombre = 'Odontología'
area1.save
area2 = Area.new
area2.nombre = 'Cardiología'
area2.save

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

persona = Persona.new
persona.nombre = 'Fulanito de Tal'
persona.save
persona1 = Persona.new
persona1.nombre = 'Perengano'
persona1.cargo = 'Gerente'
persona1.documento = 12334556
persona1.save

equipo = Equipo.new
equipo.area_id = area.id
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
equipo1.area_id = area2.id
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

mantenimiento = TipoMantenimiento.new
mantenimiento.nombre = 'Preventivo'
mantenimiento.save
mantenimiento1 = TipoMantenimiento.new
mantenimiento1.nombre = 'Correctivo'
mantenimiento1.save
mantenimiento2 = TipoMantenimiento.new
mantenimiento2.nombre = 'Predictivo'
mantenimiento2.save

agenda = Agenda.new
agenda.equipo_id = equipo.id
agenda.fecha_ejecucion = '2002/05/12'
agenda.fecha_programacion = '2002/05/01'
agenda.tipo_mantenimiento_id = mantenimiento1.id
agenda.save
agenda1 = Agenda.new
agenda1.equipo_id = equipo.id
agenda1.fecha_ejecucion = '2002/05/12'
agenda1.fecha_programacion = '2002/05/01'
agenda1.tipo_mantenimiento_id = mantenimiento2.id
agenda1.save
agenda2 = Agenda.new
agenda2.equipo_id = equipo1.id
agenda2.fecha_ejecucion = '2002/05/12'
agenda2.fecha_programacion = '2002/05/01'
agenda2.tipo_mantenimiento_id = mantenimiento.id
agenda2.save

reporte = ReporteMantenimiento.new
reporte.agenda_id = agenda1.id
reporte.descripcion_servicio = 'Servico de mantenimieno'
reporte.equipo_id = equipo1.id
reporte.agenda = agenda1
reporte.tipo_mantenimiento_id = mantenimiento2.id
reporte.responsable_id = persona1.id
reporte.save
reporte1 = ReporteMantenimiento.new
reporte1.agenda_id = agenda.id
reporte1.descripcion_servicio = 'Servico de mantenimieno'
reporte1.equipo_id = equipo1.id
reporte1.agenda = agenda2
reporte1.tipo_mantenimiento_id = mantenimiento.id
reporte1.responsable_id = persona1.id
reporte1.save

estado = Estado.new
estado.nombre = 'CHASIS/CARCAZA'
estado.save
estado1 = Estado.new
estado1.nombre = 'SOPORTES'
estado1.save
estado2 = Estado.new
estado2.nombre = 'RUEDAS Y FRENOS'
estado2.save
estado3 = Estado.new
estado3.nombre = 'ENCHUFE/RECEPTÁCULO'
estado3.save
estado4 = Estado.new
estado4.nombre = 'CABLES'
estado4.save
estado5 = Estado.new
estado5.nombre = 'ANCLAJE CORDÓN'
estado5.save
estado6 = Estado.new
estado6.nombre = 'PROTECCIÓN/FUSIBLE'
estado6.save
estado7 = Estado.new
estado7.nombre = 'TUBOS/MANGUERAS'
estado7.save
estado8 = Estado.new
estado8.nombre = 'ADAPTADORES/CONECTORES'
estado8.save
estado9 = Estado.new
estado9.nombre = 'ELECTRODOS/TRANSDUCTORES'
estado9.save
estado10 = Estado.new
estado10.nombre = 'FILTROS'
estado10.save
estado11 = Estado.new
estado11.nombre = 'CALENTADOR/RESISTENCIA'
estado11.save
estado12 = Estado.new
estado12.nombre = 'MOTOR/BOMBA/COMPRESOR'
estado12.save
estado13 = Estado.new
estado13.nombre = 'DISPLAYS/INDICADORES'
estado13.save
estado14 = Estado.new
estado14.nombre = 'CONTROLES/SWICH'
estado14.save
estado15 = Estado.new
estado15.nombre = 'BATERÍA/CARGADOR'
estado15.save
estado16 = Estado.new
estado16.nombre = 'CALIBRACIÓN/AUTOTEST'
estado16.save
estado17 = Estado.new
estado17.nombre = 'ALARMAS'
estado17.save
estado18 = Estado.new
estado18.nombre = 'SEÑALES AUDIBLES'
estado18.save
estado19 = Estado.new
estado19.nombre = 'ACCESORIOS'
estado19.save
estado20 = Estado.new
estado20.nombre = 'PARTES MÓVILES'
estado20.save

estado_equipo = EstadoEquipo.new
estado_equipo.reporte_mantenimiento_id = reporte.id
estado_equipo.estado_id = estado.id
estado_equipo.resultado = 'Ap'
estado_equipo.evaluacion = ''
estado_equipo.save
estado_equipo1 = EstadoEquipo.new
estado_equipo1.reporte_mantenimiento_id = reporte.id
estado_equipo1.estado_id = estado1.id
estado_equipo1.resultado = 'Rp'
estado_equipo1.evaluacion = 'El soporte llegó rayado'
estado_equipo1.save
estado_equipo2 = EstadoEquipo.new
estado_equipo2.reporte_mantenimiento_id = reporte.id
estado_equipo2.estado_id = estado2.id
estado_equipo2.resultado = 'N/A'
estado_equipo2.evaluacion = ''
estado_equipo2.save

repuesto = Repuesto.new
repuesto.descripcion = 'Carcaza para espectofotometro'
repuesto.referencia = 'ZP67890'
repuesto.save
repuesto1 = Repuesto.new
repuesto1.descripcion = 'Cable recubierto de cobre'
repuesto1.referencia = 'UTF8'
repuesto1.save
repuesto2 = Repuesto.new
repuesto2.descripcion = 'Interruptor para aparatos'
repuesto2.referencia = 'FIN123'
repuesto2.save
repuesto3 = Repuesto.new
repuesto3.descripcion = 'Relee de uso simple'
repuesto3.referencia = 'R3L33'
repuesto3.save

repuesto_equipo = RepuestoEquipo.new
repuesto_equipo.reporte_mantenimiento_id = reporte.id
repuesto_equipo.repuesto_id = repuesto.id
repuesto_equipo.cantidad = 2
repuesto_equipo.save
repuesto_equipo1 = RepuestoEquipo.new
repuesto_equipo1.reporte_mantenimiento_id = reporte.id
repuesto_equipo1.repuesto_id = repuesto1.id
repuesto_equipo1.cantidad = 3
repuesto_equipo1.save
repuesto_equipo2 = RepuestoEquipo.new
repuesto_equipo2.reporte_mantenimiento_id = reporte.id
repuesto_equipo2.repuesto_id = repuesto2.id
repuesto_equipo2.cantidad = 7
repuesto_equipo2.save

prestador = PrestadorMantenimiento.new
prestador.cargo = 'Gerente'
prestador.documento = 1234567
prestador.empresa = 'J-Médicas'
prestador.reporte_mantenimiento_id = reporte.id
prestador.responsable_id = persona.id
prestador.save