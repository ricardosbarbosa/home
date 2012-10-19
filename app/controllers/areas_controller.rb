# encoding: utf-8
class AreasController < ApplicationController
  filter_resource_access

  # GET /areas
  # GET /areas.json
  def index
    @residencial = Residencial.find(params[:residencial_id])
    @areas = Area.where(:residencial_id => @residencial.id)
    #@areas = Area.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @areas }
    end
  end

  # GET /areas/1
  # GET /areas/1.json
  def show
    @area = Area.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @area }
    end
  end

  # GET /areas/new
  # GET /areas/new.json
  def new
    @residencial = Residencial.find(params[:residencial_id])
    @area = Area.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @area }
    end
  end

  # GET /areas/1/edit
  def edit
    @residencial = Residencial.find(params[:residencial_id])
    @area = Area.find(params[:id])
  end

  # POST /areas
  # POST /areas.json
  def create
    @residencial = Residencial.find(params[:residencial_id])
    @area = @residencial.areas.build(params[:area])
    #@area = Area.new(params[:area])

    respond_to do |format|
      if @area.save
        #format.html { redirect_to [@area.residencial, @area], notice: 'Área foi atualiazado com sucesso.' }
        format.html { redirect_to residencial_areas_url, notice: 'Área foi atualiazado com sucesso.' }

        format.json { render json: @area, status: :created, location: @area }
      else
        format.html { render action: "new" }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /areas/1
  # PUT /areas/1.json
  def update
    @area = Area.find(params[:id])

    respond_to do |format|
      if @area.update_attributes(params[:area])
        #format.html { redirect_to [@area.residencial, @area], notice: 'Área foi atualiazado com sucesso.' }
        format.html { redirect_to residencial_areas_url, notice: 'Área foi atualiazado com sucesso.' }

        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /areas/1
  # DELETE /areas/1.json
  def destroy
    @area = Area.find(params[:id])
    @area.destroy

    respond_to do |format|
      format.html { redirect_to residencial_areas_url }
      format.json { head :no_content }
    end
  end
end
