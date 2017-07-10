class VendorProtectedController < ApplicationController
  before_filter :authenticate_vendor, only: [:index]
  before_filter :some_missing_method, only: [:show]

  def index
    head :ok
  end

  def show
  end
end
