class ProfilesController < ApplicationController

  #before_action :logged_in_user, only: [:create, :destroy]

# def index
#  @profiles=Profile.all.order("price")
# end

def index
  @profiles=Profile.all.order("price")
  if params[:search]
    @profiles = Profile.search(params[:search]).order("created_at DESC")
  else
    @profiles = Profile.all.order("created_at DESC")
  end
end

def show
  #@profile1=User.all
 @profile = current_user.profile
#Cloudinary::Uploader.upload("public/uploads/test.jpeg",  :cloud_name => "ddonv1h1s")
end

def new
  @profile=Profile.new
end

def create
  @user=current_user
  @profile = @user.create_profile(profile_params)
  @profile.picture=params['profile_picture']  
  if @profile.save
      flash[:success] = "Profile created!"
      redirect_to root_url
      else
        flash[:danger] =@profile.errors.full_messages
      end
  end

  def destroy
  end

  private

    def profile_params
    params.require(:profile).permit(:fname, :price, :room_type, :phone, :details, :allowed, :address, :picture)
    end

end
