class RoomsController < ApplicationController
  
  def index
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params) #room_params（プライベートメソッド）を持って、インスタンス変数に代入
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end
  
  private

  def room_params
    params.require(:room).permit(:name, user_ids: []) #permit部分において、配列に対して保存を許可したい場合は、キーに対して[]を値として記述する。
  end
end
