class SnapsController < ApplicationController
  before_action :find_snap, only: [:show, :edit, :update, :destroy]

  def index
    @snaps = Snap.all.order("created_at DESC")
  end

  def show
  end

  def new
    @snap = Snap.new
  end

  def create
    @snap = Snap.new(snap_params)
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

  private

  def snap_params
    params.require(:snap).permit(:title, :description)
  end

  def find_snap
    @snap = Snap.find(params[:id])
  end

end
