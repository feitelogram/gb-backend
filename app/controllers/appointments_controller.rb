class AppointmentsController < ApplicationController
def index
    appointments = Appointment.all
    render json: appointments, include: [:saved]
end

def show
    appointment = Appointment.find(params[:id])
    if appointment.valid?
        render json: appointment, include: [:saved]
    else
        render json: {error: "appointment not found"}
end
end

def create
    appointment = Appointment.create(appointment_params)
    if appointment.valid?
        render json: appointment, include: [:saved]
    else
        render json: {error: "invalid params"}
    end
end

def destroy
    appointment = Appointment.find(params[:id])
    if appointment.valid?
        appointment.destroy
        render json: {message: "success"}
    else
        render json: {message: "could not find"}
    end
end


private

def appointment_params
    params.permit(:saved_id, :date)
end


end
