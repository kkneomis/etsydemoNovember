require 'test_helper'

class EsteemsControllerTest < ActionController::TestCase
  setup do
    @esteem = esteems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:esteems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create esteem" do
    assert_difference('Esteem.count') do
      post :create, esteem: { comment: @esteem.comment, condition: @esteem.condition, email: @esteem.email, name: @esteem.name, title: @esteem.title }
    end

    assert_redirected_to esteem_path(assigns(:esteem))
  end

  test "should show esteem" do
    get :show, id: @esteem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @esteem
    assert_response :success
  end

  test "should update esteem" do
    patch :update, id: @esteem, esteem: { comment: @esteem.comment, condition: @esteem.condition, email: @esteem.email, name: @esteem.name, title: @esteem.title }
    assert_redirected_to esteem_path(assigns(:esteem))
  end

  test "should destroy esteem" do
    assert_difference('Esteem.count', -1) do
      delete :destroy, id: @esteem
    end

    assert_redirected_to esteems_path
  end
end
