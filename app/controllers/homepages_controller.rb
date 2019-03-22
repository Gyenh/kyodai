class HomepagesController < ApplicationController

  def index
# Afficher les 8 derniers posts dans l'ordre chronologique
    @posts = Post.all.order("created_at DESC").first(8)
  end

end
