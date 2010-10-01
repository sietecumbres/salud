module GoogleCalendar
  CONFIG = YAML::load(ERB.new(File.read("#{RAILS_ROOT}/config/googlecalendar.yml")).result)[RAILS_ENV]
  USERNAME = CONFIG['username']
  PASSWORD = CONFIG['password']
	CALENDAR = CONFIG['calendar']
end