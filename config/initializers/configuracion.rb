module Salud
  CONFIG = YAML::load(ERB.new(File.read("#{RAILS_ROOT}/config/configuracion.yml")).result)[RAILS_ENV]
  LABORATORIO_ID = CONFIG['laboratorio']
end