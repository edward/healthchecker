class HealthchecksController < ApplicationController
  before_action :set_healthcheck, only: [:show]

  # GET /healthchecks
  def index
  end

  # GET /healthchecks/1
  def show
  end

  # POST /healthchecks
  def create
    @healthcheck = Healthcheck.new

    if @healthcheck.save
      redirect_to "/h/#{@healthcheck.handle}", notice: 'Healthcheck created.'
    else
      render :index
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_healthcheck
      @healthcheck = Healthcheck.where(handle: params[:handle]).first!
    end
end
