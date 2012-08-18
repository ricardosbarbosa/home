# encoding: utf-8
class ReservasController < ApplicationController
  filter_access_to :all

  # GET /reservas
  # GET /reservas.json
  def index
    @reserva = Reserva.new
    @areas = current_user.apartamento.residencial.areas

    residencial = current_user.apartamento.residencial
    @reservas = Reserva.joins(:area => :residencial)
    .where(:residenciais => {:id => residencial.id})
    .order('status, created_at')
    #.group(:status)

    ##residencial = current_user.apartamento.residencial
    #if (current_user.has_role? :sindico)
    #
    #  residencial = current_user.apartamento.residencial
    #  @reservas = Reserva.joins(:area => :residencial)
    #  .where(:residenciais => {:id => residencial.id})
    #else
    #  @reservas = Reserva.where(:user_id => current_user.id )
    #end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reservas }
    end
  end

  # GET /reservas/1
  # GET /reservas/1.json
  def show
    @reserva = Reserva.find(params[:id])
    @areas = Area.where(:residencial_id => current_user.apartamento.residencial_id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reserva }
    end
  end

  # GET /reservas/new
  # GET /reservas/new.json
  def new
    @reserva = Reserva.new
    @areas = current_user.apartamento.residencial.areas

    residencial = current_user.apartamento.residencial
    @reservas = Reserva.joins(:area => :residencial)
    .where(:residenciais => {:id => residencial.id}, :status => 'Aprovado')
    .where("data > ?", Time.zone.now)
    .order('status, created_at')

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reserva }
    end
  end

  # GET /reservas/1/edit
  def edit
    @reserva = Reserva.find(params[:id])
    @areas = Area.where(:residencial_id => current_user.apartamento.residencial_id)
  end

  # POST /reservas
  # POST /reservas.json
  def create
    @reserva = Reserva.new(params[:reserva])
    @reserva.user = current_user
    @reserva.status = "Aguardando Aprovação"
    @areas = current_user.apartamento.residencial.areas
    residencial = current_user.apartamento.residencial
    @reservas = Reserva.joins(:area => :residencial)
    .where(:residenciais => {:id => residencial.id}, :status => 'Aprovado')
    .where("data > ?", Time.zone.now)
    .order('status, created_at')

    respond_to do |format|
      if @reserva.save
        format.html { redirect_to @reserva, notice: ' - Reserva was successfully created.' }
        format.json { render json: @reserva, status: :created, location: @reserva }
      else
        format.html { render action: "new" }
        format.json { render json: @reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reservas/1
  # PUT /reservas/1.json
  def update
    @reserva = Reserva.find(params[:id])

    respond_to do |format|
      if @reserva.update_attributes(params[:reserva])
        format.html { redirect_to @reserva, notice: 'Reserva was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservas/1
  # DELETE /reservas/1.json
  def destroy
    @reserva = Reserva.find(params[:id])
    @reserva.destroy

    respond_to do |format|
      format.html { redirect_to reservas_url }
      format.json { head :no_content }
    end
  end
end
