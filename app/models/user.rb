class User < ActiveRecord::Base
	has_one :reporte_mantenimiento
	
  acts_as_authentic

  validates :login, :presence => true
  validates :email,
            :presence => true,
            :uniqueness => true,
            :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

end
