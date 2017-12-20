class EventsController < ApplicationController
    def index
        @events= Event.where(state: current_user.state)
        @out_of_state = Event.where.not(state: current_user.state)
    end
    
    def create
        @event = Event.create(event_params)
        
        if @event.valid?
            Attend.create(user: current_user, event: @event)
            
            return redirect_to events_path
        end       

        flash[:errors] = @event.errors.full_messages

        return redirect_to :back
    end
    def show
        @event = Event.find(params[:id])
    end    
    def destroy
        @event = Event.find(params[:id])
        
        @event.destroy

        return redirect_to :back
    end    
    private
        def event_params
            params.require(:event).permit(:name, :date, :city, :state).merge(user:current_user)

        end    
end
