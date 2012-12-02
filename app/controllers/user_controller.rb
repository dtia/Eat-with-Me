class UserController < ApplicationController
  def create
    render :nothing => true
    user_info_json = params[:userInfo]
    
    user_info = ActiveSupport::JSON.decode(user_info_json)
    user_id = user_info["uid"]
    name = user_info["name"]
    sex = user_info["sex"]
    profile_pic = user_info["pic_square"]
    meeting_sex = user_info["sex"]
  end
end
