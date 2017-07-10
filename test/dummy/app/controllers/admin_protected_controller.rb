class AdminProtectedController < ApplicationController
  before_filter :authenticate_admin

  def index
    head :ok
  end
end
