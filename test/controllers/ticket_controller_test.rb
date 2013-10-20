require 'test_helper'

class TicketControllerTest < ActionController::TestCase
  test "get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tickets)
  end

  test "new ticket" do
    get :new
    assert_response :success
  end

  test "display ticket" do
    get :show_ticket, :token => "sdfd"
    assert_response :success
    assert_not_nil assigns(:ticket)
  end
end
