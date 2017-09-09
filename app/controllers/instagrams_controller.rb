class InstagramsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_instagram, only: [:edit, :update, :destroy]

  def index
    @instagrams = Instagram.all
  end

  def new
    if params[:back]
    @instagram = Instagram.new(instagrams_params)
    else
    @instagram = Instagram.new
    end
  end

  def create
    @instagram = Instagram.create(instagrams_params)
    @instagram.user_id = current_user.id
    if @instagram.save
    redirect_to instagrams_path, notice: "画像を投稿しました！"
    NoticeMailer.sendmail_instagram(@instagram).deliver
    else
      render 'new'
    end
  end

  def edit
#      @instagram = Instagram.find(params[:id])
  end

  def update
#    @instagram = Instagram.find(params[:id])
    if @instagram.update(instagrams_params)
    redirect_to instagrams_path
    else
     render 'edit'
    end
  end

  def destroy
#    @instagram = Instagram.find(params[:id])
    @instagram.destroy
    redirect_to instagrams_path
  end

  def confirm
    @instagram = Instagram.new(instagrams_params)
    render :new if @instagram.invalid?
  end

  private
    def instagrams_params
      params.require(:instagram).permit(:title, :content)
    end

  def set_instagram
    @instagram = Instagram.find(params[:id])
  end


end
