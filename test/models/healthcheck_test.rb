require 'test_helper'

class HealthcheckTest < ActiveSupport::TestCase
  setup do
    @healthcheck = Healthcheck.new
  end

  test "a handle is assigned before validation" do
    assert @healthcheck.valid?
  end

  test "a handle is assigned before validation and persisted" do
    assert_equal @healthcheck.handle, @healthcheck.handle

    before_handle = @healthcheck.handle
    @healthcheck.save!
    @healthcheck.reload
    assert_equal before_handle, @healthcheck.handle
  end
end
