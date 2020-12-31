class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception,
					   unless: proc { |controller| controller.request.format.json? }
  # before_action :authenticate_user!
end
