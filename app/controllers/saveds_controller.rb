class SavedsController < ApplicationController

def index
    saveds = Saved.all
    render json: saveds, include: [:provider, :user, :appointments]
end

def show
saved = Saved.find(params[:id])
if saved.valid?
    render json: saved, include: [:user, :provider, :appointments]
else
    render json: {error: "could not find"}
end
end

def create
saved= Saved.create(saved_params)
if saved.valid?
    render json: saved, include: [:provider, :user] 
    
else
    render json: {error: "invalid params"}
end
end

def destroy
    saved = Saved.find(params[:id])
    saved.destroy
    render json: {message: "successfully deleted"}
end

private

def saved_params
    params.permit(:user_id, :provider_id)
end

end
