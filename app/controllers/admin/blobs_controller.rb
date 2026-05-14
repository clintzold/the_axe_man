class Admin::BlobsController < Admin::BaseController
  def destroy_orphan_image
    @orphan = ActiveStorage::Blob.find_by(filename: params[:name] + "." + params[:format])
    @orphan.purge_later if @orphan
    head :no_content
  end
end
