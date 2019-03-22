class HomepagesController < ApplicationController

  def index
# Afficher les 4 derniers posts dans l'ordre chronologique
    @posts = Post.all.order("created_at DESC").first(4)
  end

end
