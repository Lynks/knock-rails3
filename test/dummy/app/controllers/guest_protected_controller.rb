class GuestProtectedController < ApplicationController
  before_filter :authenticate_guest

  def index
    head :ok
  end
end
