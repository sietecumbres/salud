class AgendaController < ApplicationController
  def show
  end
	
	def new
		@agenda = Agenda.new
		@tipos = TipoMantenimiento.all
	end
	
	def create
		@agenda = Agenda.new params[:agenda]
		
		if GoogleCalendarAdapter.add_event(@agenda)
			redirect_to agenda_path(@agenda.equipo_id)
		end
	end

end
