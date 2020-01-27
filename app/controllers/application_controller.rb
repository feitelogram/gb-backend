class ApplicationController < ActionController::API
    def secret
        ENV["SECRET"]
    end
end
