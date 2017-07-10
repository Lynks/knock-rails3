class CustomUnauthorizedEntityController < ApplicationController
  before_filter :authenticate_user

  def index
    head :ok
  end

  private

  def unauthorized_entity(entity)
    head :not_found
  end
end
