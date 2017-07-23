class RumorsController < ApplicationController
  before_action :set_rumor, only:[:edit, :update, :destroy]
  
  def index
    @rumors = Rumor.all
  end
  
  def new
    if params[:back]
      @rumor = Rumor.new(rumors_params)
    else
      @rumor = Rumor.new
    end
  end
  
  def create
    @rumor=Rumor.new(rumors_params)
    if @rumor.save
      redirect_to rumors_path,notice:"噂を書きました…"
    else
      render'new'
    end
    #Rumor.create(rumors_params)
  end
  
  def edit
    @rumor = Rumor.find(params[:id])
  end
  
  def update
    @rumor = Rumor.find(params[:id])
    
    if @rumor.update(rumors_params)
      redirect_to rumors_path,notice:"噂を編集しました。"
    else
      render'edit'
    end
  end
  
  def destroy
    @rumor = Rumor.find(params[:id])
    @rumor.destroy
    redirect_to rumors_path,notice:"噂を削除しました。"
  end
  
  def confirm
    @rumor = Rumor.new(rumors_params)
    render :new if @rumor.invalid?
  end
  
  private
    def rumors_params
      params.require(:rumor).permit(:title,:content)
    end
    
    def set_rumor
      @rumor = Rumor.find(params[:id])
    end
end