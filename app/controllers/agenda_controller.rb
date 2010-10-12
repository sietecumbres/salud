class AgendaController < ApplicationController
  def index
		@agendas = current_equipo.agendas
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
		redirect_to agendas_path(@agenda.equipo)
	end

	def update
		@agenda = Agenda.where(:id => params[:id]).first
		if @agenda.update_attributes(params[:agenda])
			redirect_to agendas_path(@agenda.equipo_id)
		else
			@tipos = TipoMantenimiento.all
			render :layout => false, :action => 'edit'
		end
	end
end
