class GalleriesController < ApplicationController
  

  
  def show
      
      @gallery_attachments = Gallery.all
      @gallery = Gallery.find(params[:id])
  end
  
  def index
      @galleries = Gallery.all
  end

  def new
      @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)
      
    if @gallery.save
        redirect_to galleries_path, notice: "The gallery #{@gallery.name} has been uploaded."
    else
        render "new"
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    redirect_to galleries_path, notice:  "The gallery #{@gallery.name} has been deleted."
  end
  
  private
      def gallery_params
        params.require(:gallery).permit(:name, :attachment)
      end
end
