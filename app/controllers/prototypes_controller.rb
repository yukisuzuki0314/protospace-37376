class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
    unless user_signed_in? && current_user.id == @prototype.user_id 
     #unless user_signed_in? || current_user.id != @prototype.user_id 
     redirect_to action: :index
    else
      @prototype = Prototype.find(params[:id])
    end
  end

  def update
    @prototype = Prototype.find(params[:id])#まだ更新前の情報
    if @prototype.update(prototype_params)#更新前の情報を入力された情報に上書き
      redirect_to  prototype_path(@prototype.id) 
    else #上書き出来なかったら 更新前の@prototypeを持って。
      render :edit
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end
  

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  
end
