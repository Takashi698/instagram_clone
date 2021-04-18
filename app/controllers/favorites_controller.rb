class FavoritesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @favourites = current_user.favourites.all
  end
  def create
    favourite = current_user.favourites.create(picture_id: params[:picture_id])
    redirect_to pictures_url, notice: "#{favourite.picture.user.name}さんの投稿をお気に入り登録しました"
  end
  def destroy
    favourite = current_user.favourites.find_by(id: params[:id]).destroy
    redirect_to pictures_url, notice: "#{favourite.picture.user.name}さんの投稿をお気に入り解除しました"
  end
end
