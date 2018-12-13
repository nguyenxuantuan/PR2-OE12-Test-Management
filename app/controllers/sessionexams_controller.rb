class SessionexamsController < ApplicationController
  before_action :current_sessionexam, only: %i(show edit update destroy)

  def index
    @sessionexams = Sessionexam.all
  end

  def show; end

  def create
    sessionexam = Sessionexam.create sessionexam_params
    redirect_to sessionexams_path
  end

  def new
    @sessionexam = Sessionexam.new
  end

  def edit
    @sessionexam = Sessionexam.find_by params[:id]
  end

  def update
    if
      @sessionexam = Sessionexam.find(params[:id])
      @sessionexam.update(sessionexam_params)
      redirect_to sessionexam_path(@sessionexam)
    else
      flash[:error] = "chua thanh cong"
      render :edit
    end
  end

  def destroy
    @sessionexam = Sessionexam.find_by params[:id]
    @sessionexam.destroy
    redirect_to sessionexams_path
  end

  private

  def sessionexam_params
    params.require(:sessionexam).permit :exam_name, :period_for, :supervisor, :create_at, :updated_at
  end

  def current_sessionexam
    @sessionexam = Sessionexam.find_by params[:id]
    return if @sessionexam
    flash[:error] ="khong co ky thi"
    redirect_to sessionexams_path
  end
end
