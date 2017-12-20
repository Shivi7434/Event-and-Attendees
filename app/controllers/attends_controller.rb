class AttendsController < ApplicationController

    def create
        event = Event.find(params[:attend][:event_id])
        Attend.create(attend_params) unless event.attendees.include? current_user

        return redirect_to :back
    end

    def destroy
        @organization = Organization.find(params[:id])
        
        @organization.destroy

    end 
       
    private
        def attend_params
            params.require(:attend).permit(:event_id).merge(user: current_user)
        end    

end
