class HomepagesController < ApplicationController
# Permet de cacher la navbar sur la page d'accueil
  skip_before_action :show_navbar

  def index
# Afficher les 4 derniers posts dans l'ordre chronologique
    @posts = Post.all.order("created_at DESC").first(4)
  end

end
