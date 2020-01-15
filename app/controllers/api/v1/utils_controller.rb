class Api::V1::UtilsController < ApplicationController
  def subscribe
    render json: { status: 'ok' }
  end
end
