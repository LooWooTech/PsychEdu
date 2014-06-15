module Admin
  class ImagesController < AdminController

    def create
      @image = current_user.uploaded_images.create(:file => params[:file])
      render :status => 200, :plain => @image.url
    end

  end
end
