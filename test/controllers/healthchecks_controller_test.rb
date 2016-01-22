require 'test_helper'

class HealthchecksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @healthcheck = healthchecks(:one)
  end

  test "should get index" do
    get healthchecks_url
    assert_response :success
  end

  test "should create healthcheck" do
    assert_difference('Healthcheck.count') do
      post healthchecks_url
    end

    @healthcheck = Healthcheck.last

    assert_redirected_to "/h/#{@healthcheck.handle}"
  end

  test "should show healthcheck" do
    get healthcheck_url(@healthcheck, handle: @healthcheck.handle)
    assert_response :success
  end
end
