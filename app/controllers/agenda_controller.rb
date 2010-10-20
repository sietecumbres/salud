class AgendaController < ApplicationController
  before_filter :require_user

	def index
		@agendas = current_equipo.agendas.paginate(:page => params[:page], :per_page => 10)
		@year = params[:year].nil? ? Date.today.year : params[:year]
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
		@tipos = TipoMantenimiento.all
		@year = params[:year].nil? ? Date.today.year : params[:year]
	end
end
