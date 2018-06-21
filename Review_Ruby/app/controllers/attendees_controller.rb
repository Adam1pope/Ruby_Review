class AttendeesController < ApplicationController
  def join
  	@user = User.find(session[:id])
    @event = Event.find(params[:id])
    @attendees = Attendee.create(user_id: @user.id, event_id: @event.id)
    @attendees.save 
     redirect_to "/events"
  end

  def destroy
  	@user = User.find(session[:id])        #grabs user 
    @event = Event.find(params[:event_id]) #grabs Event through event_id
    @event.users_attended.destroy(@user)   #deletes user attending event
    @event.save
    redirect_to :back  #goes back to last route 
  end

end
