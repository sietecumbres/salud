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
		
	end
	
end