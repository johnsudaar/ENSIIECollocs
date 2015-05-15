require 'test_helper'

class CollocsControllerTest < ActionController::TestCase
  setup do
    @colloc = collocs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:collocs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create colloc" do
    assert_difference('Colloc.count') do
      post :create, colloc: { adresse: @colloc.adresse, max_people: @colloc.max_people, places: @colloc.places, price: @colloc.price, size: @colloc.size, titre: @colloc.titre }
    end

    assert_redirected_to colloc_path(assigns(:colloc))
  end

  test "should show colloc" do
    get :show, id: @colloc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @colloc
    assert_response :success
  end

  test "should update colloc" do
    patch :update, id: @colloc, colloc: { adresse: @colloc.adresse, max_people: @colloc.max_people, places: @colloc.places, price: @colloc.price, size: @colloc.size, titre: @colloc.titre }
    assert_redirected_to colloc_path(assigns(:colloc))
  end

  test "should destroy colloc" do
    assert_difference('Colloc.count', -1) do
      delete :destroy, id: @colloc
    end

    assert_redirected_to collocs_path
  end
end
