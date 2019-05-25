class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :display
    include SessionsHelper

    def display
        @categories = Category.all
        @location = Location.all
    end
end
