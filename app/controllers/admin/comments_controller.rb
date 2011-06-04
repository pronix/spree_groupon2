class Admin::CommentsController < Admin::ResourceController

  def index
    @collection = Comment.unconfirmed.paginate :page => params[:page],
      :per_page => 10, :order => 'created_at DESC'

    respond_with @collection
  end

  def update
    @object = Comment.find(params[:id])
    if @object.update_attribute(:confirmed, true)
      flash[:notice] = I18n.t(:successfully_approved)
      respond_with(@object) do |format|
        format.js { render :partial => "/admin/shared/destroy" }
      end
    end
  end

  def confirmed
    @collection = Comment.confirmed.paginate :page => params[:page],
      :per_page => 10, :order => 'created_at DESC'

    respond_with @collection
  end

end
