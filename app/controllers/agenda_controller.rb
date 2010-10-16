class AgendaController < ApplicationController

  before_filter :require_user

	def index
		@agendas = current_equipo.agendas
    @reporte = ReporteMantenimiento.where(:id => params[:id]).first
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

	def general
		@equipos = Equipo.all
	end

	def autogenerate_form
		@tipos = TipoMantenimiento.all
		render :layout => false
	end

	def autogenerate
		desde = Date.new(params[:desde].to_i, 1, 1)

		Agenda.generate_agendas(Equipo.alto_riesgo, params[:periodicidad].to_i, params[:tipo_mantenimiento], desde)
		Agenda.generate_agendas(Equipo.moderado_riesgo, params[:periodicidad].to_i, params[:tipo_mantenimiento], desde)
		Agenda.generate_agendas(Equipo.bajo_riesgo, params[:periodicidad].to_i, params[:tipo_mantenimiento], desde)

		Autoagenda.create :ano => desde.year
		
		flash[:notice] = "Agendas creadas!"
		redirect_to agenda_general_path
	end
end
