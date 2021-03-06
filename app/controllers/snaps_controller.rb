class SnapsController < ApplicationController
  before_action :find_snap, only: [:show, :edit, :update, :destroy, :upvote]

  def index
    @snaps = Snap.all.order("created_at DESC")
  end

  def show
  end

  def new
    @snap = current_user.snaps.build
  end

  def create
    @snap = current_user.snaps.build(snap_params)
  #   If snap able to save
    if @snap.save
      redirect_to @snap, notice: "Successfully created new snap"
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    # Up top in before action, snap is found
    # If snap is found, redirect to
    if @snap.update(snap_params)
      redirect_to @snap, notice: "Snap was successfully updated"
    else
      render 'edit'
    end
  end

  def destroy
    @snap.destroy
    redirect_to root_path
  end

  def upvote
    @snap.upvote_by current_user
    redirect_to :back
  end


  private

  # ToDo: Add longitude and latitude
  # ToDo: Add difficulty rating
  # ToDo: Add cudos or thumbs-up

  def snap_params
    params.require(:snap).permit(:title, :description, :image)
  end

  def find_snap
    @snap = Snap.find(params[:id])
  end

end
