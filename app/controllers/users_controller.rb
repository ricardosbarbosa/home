class UsersController < ApplicationController
  filter_resource_access

  # GET /residenciais
  # GET /residenciais.json
  def index
    @users = User.where(:apartamento_id => params[:apartamento_id])
    #@users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /residenciais/1
  # GET /residenciais/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /residenciais/new
  # GET /residenciais/new.json
  def new
    @residencial = Residencial.find(params[:residencial_id])
    @apartamento = Apartamento.find(params[:apartamento_id])
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /residenciais/1/edit
  def edit
    @residencial = Residencial.find(params[:residencial_id])
    @apartamento = Apartamento.find(params[:apartamento_id])
    @user = User.find(params[:id])
  end

  # POST /residenciais
  # POST /residenciais.json
  def create
    @residencial = Residencial.find(params[:residencial_id])
    @apartamento = Apartamento.find(params[:apartamento_id])
    @user = @apartamento.users.build(params[:user])

    role = Role.find_by_nome("condomino")
    @user.roles << role
    #@user = User.new(params[:residencial])

    respond_to do |format|
      if @user.save
        #format.html { redirect_to [@user.apartamento.residencial, @user.apartamento, @user], notice: 'User was successfully created.' }
        format.html { redirect_to residencial_apartamento_users_path, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /residenciais/1
  # PUT /residenciais/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        #format.html { redirect_to [@user.apartamento.residencial, @user.apartamento, @user], notice: 'User was successfully updated.' }
        format.html { redirect_to edit_residencial_apartamento_user_path(@user.apartamento.residencial, @user.apartamento, @user), notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /residenciais/1
  # DELETE /residenciais/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to residencial_apartamento_users_url }
      format.json { head :no_content }
    end
  end
end
