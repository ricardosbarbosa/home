class ResidenciaisController < ApplicationController
  filter_access_to :all

  # GET /residenciais
  # GET /residenciais.json
  def index
    @residenciais = Residencial.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @residenciais }
    end
  end

  # GET /residenciais/1
  # GET /residenciais/1.json
  def show
    @residencial = Residencial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @residencial }
    end
  end

  # GET /residenciais/new
  # GET /residenciais/new.json
  def new
    @residencial = Residencial.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @residencial }
    end
  end

  # GET /residenciais/1/edit
  def edit
    @residencial = Residencial.find(params[:id])
  end

  # POST /residenciais
  # POST /residenciais.json
  def create
    @residencial = Residencial.new(params[:residencial])

    respond_to do |format|
      if @residencial.save
        format.html { redirect_to @residencial, notice: 'Residencial was successfully created.' }
        format.json { render json: @residencial, status: :created, location: @residencial }
      else
        format.html { render action: "new" }
        format.json { render json: @residencial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /residenciais/1
  # PUT /residenciais/1.json
  def update
    @residencial = Residencial.find(params[:id])

    respond_to do |format|
      if @residencial.update_attributes(params[:residencial])
        format.html { redirect_to @residencial, notice: 'Residencial was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @residencial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /residenciais/1
  # DELETE /residenciais/1.json
  def destroy
    @residencial = Residencial.find(params[:id])
    @residencial.destroy

    respond_to do |format|
      format.html { redirect_to residenciais_url }
      format.json { head :no_content }
    end
  end

  def vizinhos
    #@residencial = Residencial.find(params[:residencial_id])
    @vizinhos = User.
        joins(:apartamento => :residencial)
    .where(:residenciais => {:id => current_user.apartamento.residencial_id})
    .order("apartamentos.numero, email")

  end

  def registro
    @residencial = Residencial.new
    @sindico = User.new
  end
end
