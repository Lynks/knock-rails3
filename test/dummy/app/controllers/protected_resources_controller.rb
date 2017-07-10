class ProtectedResourcesController < ApplicationController
  before_filter :authenticate_user

  def index
    head :ok
  end
end
