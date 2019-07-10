class ApplicationController < ActionController::API

  # Eureka MicroService HealthCheck
  def health
    respond_to do |format|
      format.json { render json: {status: 'UP'}}
    end
  end
end
