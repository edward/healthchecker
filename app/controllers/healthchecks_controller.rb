class HealthchecksController < ApplicationController
  before_action :set_healthcheck, only: [:show]
  before_action :set_opinion_handle, only: [:show]

  # GET /healthchecks
  def index
    @healthchecks_opined_on = healthchecks_opined
  end

  def healthchecks_opined
    if opinion_handle = cookies.signed[:opinion_handle]
      Healthcheck.joins(:opinions).where(opinions: {handle: opinion_handle}).order(created_at: :desc)
    end
  end

  # GET /healthchecks/1
  # GET /h/lkj24lkj23lkj
  def show
    @opinion = @healthcheck.opinions.find_or_initialize_by(handle: @opinion_handle)
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

  def set_healthcheck
    @healthcheck = Healthcheck.where(handle: params[:handle]).first!
  end

  def set_opinion_handle
    cookies.signed[:opinion_handle] ||= SecureRandom.uuid
    @opinion_handle = cookies.signed[:opinion_handle]
  end
end
