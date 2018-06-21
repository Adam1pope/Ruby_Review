class EventsController < ApplicationController
  def index
  	   @user = User.find(session[:id])  #grabs who is logged on 
  	   @events = Event.all           #allows using in HTML 
  	   @events_state = Event.where(state: @user.state)        #creates ability to loop through events in your state in the HTML 
  	   @other_state = Event.where.not(state: @user.state) #creates ability to loop through events NOT in your state in the HTML 
       
  end
  	
  def create
  		event = Event.create(events_params)
  		event.user_id = session[:id]    #attaches the user who created the event
  		if event.save                      #saves the user who created the event to the database
  			redirect_to "/events"
  		else
  			flash[:errors] = event.errors.full_messages
  			redirect_to :back
  		end				
  end

  def show
  	@event = Event.find(params[:id])
  	@comment = @event.comments 
  end


  def comment
  	    @user = User.find(session[:id])
  		@event = Event.find(params[:id])
  		@comment = Comment.create(text: params[:comment], author: @user.first_name, event: Event.find(params[:id]))
  		redirect_to "/events/#{@event.id}/show"
  end

  def edit 
  	@event = Event.find(params[:id])
  end


  def update
  		event = Event.find(params[:id])

  		if event.update(events_params)
  			redirect_to "/events"
        else
        	flash[:errors] = event.errors.full_messages
        	redirect_to :back
        end    	
  end


  def destroy
  	event = Event.find(params[:id])
  	event.destroy
  	redirect_to "/events"
  end 

    private
    def events_params
      params.require(:event).permit(:name, :date, :city, :state)
    end
end
