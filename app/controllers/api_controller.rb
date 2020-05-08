class ApiController < ApplicationController
  before_action :set_default_format
  before_action :approved_user

  private

    def set_default_format
      request.format = :json
    end

end