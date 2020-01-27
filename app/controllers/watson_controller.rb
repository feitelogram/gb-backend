class WatsonController < ApplicationController
    def watson
        if params[:login]
            user = User.find_by(username: params[:login])
            if user.valid?
            render json: {message: params[:login]}
            else
            render json: {message: "not found"}
            end
        elsif params[:new_saved]
            user = User.find_by(username: params[:new_saved])
            place = Provider.find(params[:resource_to_save][:id])
            saved = Saved.create(user: user, provider: place)
            if saved.valid?
                render json: saved
            else
                render json: {error: "error"}
            end
        elsif params[:resource] 
            random = Provider.where(category: params[:resource]).sample          
            render json: random
        elsif params[:appointment]
            saved = Saved.find(params[:saved][:id])
            new = Appointment.create(saved: saved, date: params[:appointment])
            if new.valid?
                render json: new
            else
                render json: {error: "error"}
            end
        elsif params[:signup]
            user = User.create(username: params[:signup], password: params[:password])
            if user.valid?
                render json: {message: "success"}
            else
                render json: {error: "error"}
            end
        elsif params[:weather]
            r = `curl https://api.weather.gov/gridpoints/OKX/33,32/forecast`
            p = JSON.parse(r)
            m = p["properties"]["periods"][0]
            render json: m
        else
            render json: {message: "not found"}
        end
    end

    def api
    r = ASSISTANT.message({input: {text: params[:message]}, assistant_id: ASSISTANT_ID, session_id: SESSION_ID})
       begin
            r = r.result["output"]["generic"][0]
       rescue => exception
            response = ASSISTANT.create_session(assistant_id: ENV["AID"]) #starting a new session
            puts JSON.pretty_generate(response.result) #debugging
            r = {text: "Hold a moment as the assistant reloads! Please try again in a moment."}
        end
        render json: r
    end

end
