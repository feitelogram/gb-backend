class ProvidersController < ApplicationController
    def index
        render json: Provider.all
    end

    def show
        provider = Provider.find(params[:id])
        render json: provider
    end

    def test
       render json: {message: "hi"}
    end
end
