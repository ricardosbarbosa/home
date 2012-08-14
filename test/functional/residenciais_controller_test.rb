require 'test_helper'

class ResidenciaisControllerTest < ActionController::TestCase
  setup do
    @residencial = residenciais(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:residenciais)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create residencial" do
    assert_difference('Residencial.count') do
      post :create, residencial: { nome: @residencial.nome }
    end

    assert_redirected_to residencial_path(assigns(:residencial))
  end

  test "should show residencial" do
    get :show, id: @residencial
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @residencial
    assert_response :success
  end

  test "should update residencial" do
    put :update, id: @residencial, residencial: { nome: @residencial.nome }
    assert_redirected_to residencial_path(assigns(:residencial))
  end

  test "should destroy residencial" do
    assert_difference('Residencial.count', -1) do
      delete :destroy, id: @residencial
    end

    assert_redirected_to residenciais_path
  end
end
