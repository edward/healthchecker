class OpinionsController < ApplicationController
  before_action :set_opinion, only: [:update, :destroy]

  def create
    @opinion = Opinion.new(opinion_params)

    if @opinion.save
      redirect_to healthcheck_path(handle: @opinion.healthcheck.handle), notice: 'Opinion added.'
    else
      redirect_to @opinion.healthcheck, notice: 'Opinion needs more.'
    end
  end

  def update
    if @opinion.update(opinion_params)
      redirect_to healthcheck_path(handle: @opinion.healthcheck.handle), notice: 'Opinion updated.'
    else
      redirect_to @opinion.healthcheck, notice: 'Opinion needs more.'
    end
  end

  # DELETE /opinions/1
  # DELETE /opinions/1.json
  def destroy
    @opinion.destroy
    redirect_to root_path, notice: 'Opinion was removed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_opinion
    @opinion = Opinion.find(params[:id])
  end

  def opinion_params
    params.require(:opinion).permit(:handle, :healthcheck_id, :champion)
  end
end
