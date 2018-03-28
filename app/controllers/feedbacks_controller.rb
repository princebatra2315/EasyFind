class FeedbacksController < ApplicationController

  def new
  @feedback=Feedback.new
  end

  def create
    @feedback = Feedback.create(feedback_params)
    if @feedback.save
    flash[:success] = "Feedback Submitted"
    redirect_to root_url
    else
    flash[:danger]="Feedback Not Submitted"
    redirect_to contact_url
    end
  end

  def destroy
   @feedback=feedback.find()
   @feedback.destroy
   flash[:success]="Feedback Deleted"
   redirect_to contact_url
  end

  def index
   @feedback=Feedback.all
  end


  private

   def feedback_params
    params.require(:feedback).permit(:name, :email, :subject, :message )
    end

end


