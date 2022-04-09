class HomesController < ApplicationController

  def top
    @genres = Genre.all
#いいねの多い投稿順の上から３番目まで表示
    @book = Book.limit(3).sort_books(sort: 'favorited_desc')
  end
#言語設定を動的に変更
  def language
    session[:locale] = params[:lang]
    redirect_back(fallback_location: "/")
    flash[:notice] = t('notice.set_locale')
  end
end
