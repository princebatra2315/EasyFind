class ProfilesController < ApplicationController

  # before_action :logged_in_user, only: [:create, :destroy, :edit]
   
def index
  # @profiles=Profile.paginate(:page => params[:page], per_page: 1).order("price")
  @profiles=Profile.all.order("price")
  if params[:search]
    @profiles = Profile.search(params[:search]).order("created_at DESC")
  else
    @profiles = Profile.all.order("created_at DESC")
  end
end


def filter
  @priceprofiles=[]
  @typeprofiles=[]
  @allowedprofiles=[]
  @profiles=[]
  @flag=0
  if(params['I'])
  @temp=Profile.where('price<=?', 5000)
  @temp.each do |temp|
    @priceprofiles<<temp
  end
  @flag=1
  end

 if(params['II'])
  @temp=Profile.where('price>=?', 5000).where('price<=?', 8000)
  @temp.each do |temp|
    @priceprofiles<<temp
  end
  @flag=1
  end

 if(params['III'])
  @temp=Profile.where('price>=?', 8000)
  @temp.each do |temp|
    @priceprofiles<<temp
  end
  @flag=1
  end

  if(params['boys'])
  @temp=Profile.where('allowed=?', 'Only Boys')
  @temp.each do |temp|
    @allowedprofiles<<temp
  end
  @flag=1
  end

  if(params['girls'])
  @temp=Profile.where('allowed=?', 'Only Girls')
  @temp.each do |temp|
    @allowedprofiles<<temp
  end
  @flag=1
  end

    if(params['both'])
  @temp=Profile.where('allowed=?', 'Both')
  @temp.each do |temp|
    @allowedprofiles<<temp
  end
  @flag=1
  end

 if(params['flat'])
  @temp=Profile.where('room_type=?', 'FLAT')
  @temp.each do |temp|
    @typeprofiles<<temp
  end
  @flag=1
  end

   if(params['pg'])
  @temp=Profile.where('room_type=?', 'PG')
  @temp.each do |temp|
    @typeprofiles<<temp
  end
  @flag=1
  end
  

  @profiles=(@priceprofiles | @typeprofiles | @allowedprofiles)


   @profiles=@profiles.uniq.reverse
   
   if(@flag==0)
    @profiles=Profile.all
  end
    
       respond_to do |format|
        format.js {render :template => "profiles/filter"}
      end

end

def show
 @profile = current_user.profile
end

def new
  @profile=Profile.new
end

def create
  @user=current_user
  @profile = @user.create_profile(profile_params)
  @profile.picture=params['profile_picture']  
  @profile.latitude=params['profile_lat']
  @profile.longitude=params['profile_lng']
  if @profile.save
      flash[:success] = "Profile created!"
      redirect_to root_url
      else
      render 'new'
      end
  end


  
  def edit
  @profile=Profile.find(params[:id])
  end

  def update
  @profile=Profile.find(params[:id])
  if @profile.update_attributes(profile_params)
  flash[:success]="profile updated"
   redirect_to root_path
  else
  render 'edit'
  end
  end

  def destroy
  end

  private

    def profile_params
    params.require(:profile).permit(:fname, :price, :room_type, :phone, :details, :allowed, :address, :picture)
    end

end
