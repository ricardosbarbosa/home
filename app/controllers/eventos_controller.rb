class EventosController < ApplicationController
  filter_resource_access

  # GET /eventos
  # GET /eventos.json
  def index
    residencial = current_user.apartamento.residencial
    #@eventos = Evento.joins(:user => [{:apartamento => :residencial}])
    #.where(:residenciais => {:id => residencial.id})
    #.order("created_at DESC")

    @eventos = Evento
    .where(:residencial_id => residencial.id)
    .order("created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @eventos }
    end
  end

  # GET /eventos/1
  # GET /eventos/1.json
  def show

    @evento = Evento.find(params[:id])
    @comentarios = Comentario.where(:comentavel_id => @evento.id, :comentavel_type => "Evento").order('created_at DESC')

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @evento }
    end
  end

  # GET /eventos/new
  # GET /eventos/new.json
  def new
    @evento = Evento.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @evento }
    end
  end

  # GET /eventos/1/edit
  def edit
    @evento = Evento.find(params[:id])
  end

  # POST /eventos
  # POST /eventos.json
  def create
    @evento = Evento.new(params[:evento])
    @evento.user = current_user
    @evento.residencial = current_user.apartamento.residencial

    respond_to do |format|
      if @evento.save
        format.html { redirect_to @evento, notice: 'Evento foi criado com sucesso.' }
        format.json { render json: @evento, status: :created, location: @evento }

        comentario = Comentario.new
        comentario.user = current_user
        comentario.comentavel_id = @evento.id
        comentario.comentavel_type = "Evento"
        comentario.conteudo = "Novo evento"
        comentario.titulo = "Novo evento"

        comentario.save

      else
        format.html { render action: "new" }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /eventos/1
  # PUT /eventos/1.json
  def update
    @evento = Evento.find(params[:id])

    respond_to do |format|
      if @evento.update_attributes(params[:evento])
        format.html { redirect_to @evento, notice: 'Evento foi atualiazado com sucesso.' }
        format.json { head :no_content }

        comentario = Comentario.new
        comentario.user = current_user
        comentario.comentavel_id = @evento.id
        comentario.comentavel_type = "Evento"
        comentario.conteudo = "Evento atualizado"
        comentario.titulo = "Evento atualizado"

        comentario.save

      else
        format.html { render action: "edit" }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eventos/1
  # DELETE /eventos/1.json
  def destroy
    @evento = Evento.find(params[:id])
    @comentarios = Comentario.where(:comentavel_id => @evento.id).order('created_at DESC')

    if @comentarios
      @comentarios.delete_all
    end
    @evento.destroy

    respond_to do |format|
      format.html { redirect_to eventos_url }
      format.json { head :no_content }
    end
  end
end
