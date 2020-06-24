module Api::V1
  class BaseController < ActionController::API
    before_action do
      ActiveStorage::Current.host = request.base_url
    end
  end
end
