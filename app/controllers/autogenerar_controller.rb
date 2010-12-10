class AutogenerarController < ApplicationController

  before_filter :require_user
  
	def new
		@tipos = TipoMantenimiento.all
		render :layout => false
	end

	def create
		#desde = Date.parse(params[:desde])
		desde = Date.new(params[:desde].to_i, 1, 1)

		Agenda.generate_agendas(Equipo.alto_riesgo, params[:periodicidad].to_i, params[:tipo_mantenimiento], desde)
		Agenda.generate_agendas(Equipo.moderado_riesgo, params[:periodicidad].to_i, params[:tipo_mantenimiento], desde)
		Agenda.generate_agendas(Equipo.bajo_riesgo, params[:periodicidad].to_i, params[:tipo_mantenimiento], desde)

		Autoagenda.create :ano => desde.year, :tipo_mantenimiento_id => params[:tipo_mantenimiento]

		flash[:notice] = "Agendas creadas!"
		redirect_to agenda_general_path
	end

	def validate_date
		render :json => Autoagenda.anios_disponibles(params[:tipo_mantenimiento].to_i), :layout => false
	end

end
