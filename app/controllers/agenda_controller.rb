class AgendaController < ApplicationController

	def index
		@equipos = Equipo.all
		@agendas = current_equipo.agendas
    @reporte = ReporteMantenimiento.find(params[:id])
  end
	
	def new
		@agenda = Agenda.new
		@tipos = TipoMantenimiento.all
		render :layout => false
	end

	def edit
		@agenda = Agenda.where(:id => params[:id]).first
		@tipos = TipoMantenimiento.all
		render :layout => false
	end
	
	def create
		current_equipo.agendas << Agenda.create(params[:agenda])
		redirect_to agendas_path(current_equipo)
	end

	def update
		logger.debug "Current Equipo => #{current_equipo}"
		@agenda = Agenda.where(:id => params[:id]).first
		if @agenda.update_attributes(params[:agenda])
			redirect_to agendas_path(current_equipo)
		else
			@tipos = TipoMantenimiento.all
			render :layout => false, :action => 'edit'
		end
	end

	def destroy
		@agenda = current_equipo.agendas.where(:id => params[:id]).first
		@agenda.destroy
		redirect_to agendas_path(current_equipo)
	end
end
