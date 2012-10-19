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

    if params[:residencial_nome]
      @residencial = Residencial.new
      @residencial.nome = params[:residencial_nome]


    else
      @residencial = Residencial.new(params[:residencial])
    end




    respond_to do |format|
      if @residencial.save
        format.html { redirect_to root_path, notice: 'Residencial foi criado com sucesso.' }
        format.json { render json: @residencial, status: :created, location: @residencial }

        if params[:residencial_nome]

          @apartamento = @residencial.apartamentos.build()
          @apartamento.numero = params[:apartamento]
          if @apartamento.save
            @sindico = @apartamento.users.build()

            @sindico.email = params[:email]
            role = Role.find_by_nome("sindico")
            @sindico.roles << role
            password = (0...4).map{ ('a'..'z').to_a[rand(26)] }.join
            password << (0...4).map{ (0..9).to_a[rand(10)] }.join
            @sindico.password =  password

            @sindico.save
          end

        end

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
        format.html { redirect_to @residencial, notice: 'Residencial foi atualiazado com sucesso.' }
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
    @roles = Role.where('nome != ? ', :admin)
    @residencial = current_user.apartamento.residencial
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

  def convite

    @residencial = current_user.apartamento.residencial

    if params[:email]


      @apartamento = @residencial.apartamentos.build
      @condomino = @apartamento.users.build()
      @apartamento.numero = params[:apartamento]
      if @apartamento.save(:validate => false)


        @condomino.email = params[:email]

        role_ids = params[:role_ids]

        role_ids.each do |r_id|
          role = Role.find(r_id)
          @condomino.roles << role
        end

        #role = Role.find_by_nome("condomino")
        #@condomino.roles << role

        password = (0...4).map{ ('a'..'z').to_a[rand(26)] }.join
        password << (0...4).map{ (0..9).to_a[rand(10)] }.join
        @condomino.password =  password

        respond_to do |format|
          if @condomino.save
            format.html { redirect_to :back, notice: 'Convite realizado com sucesso.' }
            format.json { head :no_content }
          else
            format.html { redirect_to :back }
            format.json { render json: @condomino.errors, status: :unprocessable_entity }
          end
        end
      end
    end

  end
end
