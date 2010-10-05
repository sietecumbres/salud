class GoogleCalendarAdapter
	
	class << self
		
		def authenticate
			service = GCal4Ruby::Service.new
			service.authenticate(GoogleCalendar::USERNAME, GoogleCalendar::PASSWORD)
			service
		end
		
		def get_calendar
			GCal4Ruby::Calendar.find(authenticate, :id => GoogleCalendar::CALENDAR)
		end
		
		def iframe
			get_calendar.to_iframe({
				:showTitle => '0',
				:showNav => '0',
				:showPrint => '0',
				:showTabs => '0',
				:showCalendars => '0',
				:showTimeZone => '0',
				:hl => "es",
				:wkst => "2",
				:width => "600"
			})
		end
		
		def add_event(agenda)
			cal = get_calendar
			event =  GCal4Ruby::Event.new(cal.service, 
																		{
																			:calendar => cal,
																			:title => "Mantenimiento #{agenda.tipo_mantenimiento.nombre} para el equipo #{agenda.equipo.placa}",
																			:start_time => Time.parse(agenda.fecha_programacion.to_s),
																			:end_time => Time.parse(agenda.fecha_programacion.to_s)
																		})
			event.all_day = true
			
			event.save if agenda.save
			agenda.event_id = event.id
			agenda.save
		end
		
	end
	
end