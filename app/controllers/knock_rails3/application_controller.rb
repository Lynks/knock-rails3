module KnockRails3
  class ApplicationController < ActionController::Base
    rescue_from KnockRails3.not_found_exception_class_name, with: :not_found

  private

    def not_found
      head :not_found
    end
  end
end
