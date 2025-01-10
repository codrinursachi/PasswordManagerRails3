class TrashController < ApplicationController
  load_and_authorize_resource :login, parent: false
  def index
    @logins = @logins.by_is_in_trash(true)
  end

  def destroy
    @login = Login.accessible_by(current_ability).find(params[:id]).destroy
  end

  def restore
    @login = Login.accessible_by(current_ability).find(params[:id])
    @login.update(trash_date: nil)
    redirect_to trash_index_path
  end
end
