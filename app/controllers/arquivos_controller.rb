class ArquivosController < ApplicationController
  filter_resource_access

  # GET /arquivos
  # GET /arquivos.json
  def index
    #@arquivos = Arquivo.all

    residencial = current_user.apartamento.residencial
    @arquivos = Arquivo
    .where(:residencial_id => residencial.id)
    .order("created_at")


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @arquivos }
    end
  end

  # GET /arquivos/1
  # GET /arquivos/1.json
  def show
    @arquivo = Arquivo.find(params[:id])
    @comentarios = Comentario.where(:comentavel_id => @arquivo.id, :comentavel_type => "Arquivo").order('created_at DESC')

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @arquivo }
    end
  end

  # GET /arquivos/new
  # GET /arquivos/new.json
  def new
    @arquivo = Arquivo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @arquivo }
    end
  end

  # GET /arquivos/1/edit
  def edit
    @arquivo = Arquivo.find(params[:id])
  end

  # POST /arquivos
  # POST /arquivos.json
  def create
    @arquivo = Arquivo.new(params[:arquivo])

    @arquivo.residencial = current_user.apartamento.residencial

    respond_to do |format|
      if @arquivo.save
        format.html { redirect_to @arquivo, notice: 'Arquivo was successfully created.' }
        format.json { render json: @arquivo, status: :created, location: @arquivo }

        comentario = Comentario.new
        comentario.user = current_user
        comentario.comentavel_id = @arquivo.id
        comentario.comentavel_type = "Arquivo"
        comentario.conteudo = "Novo arquivo"
        comentario.titulo = "Novo arquivo"

        comentario.save

      else
        format.html { render action: "new" }
        format.json { render json: @arquivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /arquivos/1
  # PUT /arquivos/1.json
  def update
    @arquivo = Arquivo.find(params[:id])

    respond_to do |format|
      if @arquivo.update_attributes(params[:arquivo])
        format.html { redirect_to @arquivo, notice: 'Arquivo was successfully updated.' }
        format.json { head :no_content }

        comentario = Comentario.new
        comentario.user = current_user
        comentario.comentavel_id = @arquivo.id
        comentario.comentavel_type = "Arquivo"
        comentario.conteudo = "Arquivo atualizadp"
        comentario.titulo = "Arquivo atualizado"

        comentario.save
      else
        format.html { render action: "edit" }
        format.json { render json: @arquivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /arquivos/1
  # DELETE /arquivos/1.json
  def destroy
    @arquivo = Arquivo.find(params[:id])

    @comentarios = Comentario.where(:comentavel_id => @arquivo.id)

    if @comentarios
      @comentarios.delete_all
    end

    @arquivo.destroy

    respond_to do |format|
      format.html { redirect_to arquivos_url }
      format.json { head :no_content }
    end
  end
end
