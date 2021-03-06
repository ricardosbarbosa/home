class ServicosController < ApplicationController
  filter_resource_access

  # GET /servicos
  # GET /servicos.json
  def index

    #@filters = Servico::FILTERS
    #if params[:show] && @filters.collect{|f| f[:scope]}.include?(params[:show])
    #  @items = Servico.send(params[:show])
    #else
    #  @items = Servico.all
    #end


    @regioes =  Servico.all_regioes
    @regioes.unshift "Todos"

    @tipos = Servico.all_tipos
    @tipos.unshift "Todos"

    @servicos = Servico.select(params[:regiao], params[:tipo])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @servicos }
    end
  end

  # GET /servicos/1
  # GET /servicos/1.json
  def show
    @servico = Servico.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @servico }
    end
  end

  # GET /servicos/new
  # GET /servicos/new.json
  def new
    @servico = Servico.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @servico }
    end
  end

  # GET /servicos/1/edit
  def edit
    @servico = Servico.find(params[:id])
  end

  # POST /servicos
  # POST /servicos.json
  def create
    @servico = Servico.new(params[:servico])

    respond_to do |format|
      if @servico.save
        format.html { redirect_to @servico, notice: 'Servico foi criado com sucesso.' }
        format.json { render json: @servico, status: :created, location: @servico }
      else
        format.html { render action: "new" }
        format.json { render json: @servico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /servicos/1
  # PUT /servicos/1.json
  def update
    @servico = Servico.find(params[:id])

    respond_to do |format|
      if @servico.update_attributes(params[:servico])
        format.html { redirect_to @servico, notice: 'Servico foi atualiazado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @servico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /servicos/1
  # DELETE /servicos/1.json
  def destroy
    @servico = Servico.find(params[:id])
    @servico.destroy

    respond_to do |format|
      format.html { redirect_to servicos_url }
      format.json { head :no_content }
    end
  end
end
