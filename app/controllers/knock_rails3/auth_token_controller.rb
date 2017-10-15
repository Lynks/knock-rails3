require_dependency "knock_rails3/application_controller"

module KnockRails3
  class AuthTokenController < ApplicationController
    before_filter :authenticate

    def create
      render json: auth_token, status: :created
    end

  private
    def authenticate
      unless entity.present? && entity.authenticate(auth_params[:password])
        raise KnockRails3.not_found_exception_class
      end
    end

    def auth_token
      if entity.respond_to? :to_token_payload
        AuthToken.new payload: entity.to_token_payload
      else
        AuthToken.new payload: { sub: entity.id }
      end
    end

    def entity
      @entity ||=
        if entity_class.respond_to? :from_token_request
          entity_class.from_token_request request
        else
          entity_class.find_by_email(auth_params[:email])
        end
    end

    def entity_class
      entity_name.constantize
    end

    def entity_name
      self.class.name.scan(/\w+/).last.split('TokenController').first
    end

    def auth_params
      params[:auth]
    end
  end
end
