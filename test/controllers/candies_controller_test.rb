require 'test_helper'

class CandiesControllerTest < ActionController::TestCase
  setup do
    @candy = candies(:one)
    @candy_two = candies(:two)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:candies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create candy" do
    assert_difference('Candy.count') do
      post :create, candy: { candy_type: @candy.candy_type }
    end

    assert_redirected_to candy_path(assigns(:candy).candy_type)
  end

  test "should show candy" do
    get :show, candy_type: "kit_kat"
    assert_response :success
  end

  test "should get edit" do
    get :edit, candy_type: "kit_kat"
    assert_response :success
  end

  test "should update candy" do
    patch :update, candy_type: "kit_kat", candy: { candy_type: @candy_two.candy_type }
    assert_redirected_to candy_path(@candy_two.candy_type)
  end

  test "should destroy candy" do
    assert_difference('Candy.count', -1) do
      delete :destroy, candy_type: "kit_kat"
    end

    assert_redirected_to candies_path
  end

  test "should return 404 if candy is not valid" do
    get :show, candy_type: "oreo"
    assert_response :not_found
  end
end
