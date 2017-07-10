class CompositeNameEntityProtectedController < ApplicationController
  before_filter :authenticate_composite_name_entity

  def index
    head :ok
  end
end
