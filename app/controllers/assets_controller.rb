class AssetsController < UsersController
  layout false
  def show
    redirect_to assets_path(user: params[:id])
  end

  def index
    render :show
  end
end
