class ProfileController < ApplicationController
  before_action :authenticate_user!

  def edit
    @profile = current_user
  end

  def update
    set_profile
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profile_url, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:user).permit(:image)
    end

end
