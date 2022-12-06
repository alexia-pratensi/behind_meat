class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about ]

  def home
  end

  def dashboard
    @assos = Asso.all
    @consos = current_user.consos
    @days = Day.where(user_id: current_user.id)
    @seven_days = @days.first(7)
    @last_day = @days.last

    # Consommation de boeuf
    # @days.where(user.id == current_user.id)

    @boeuf_total_conso = @consos.where(meat_id: Meat.find_by_meat_type('boeuf')).pluck(:quantity).sum
    @boeuf_percent = (@boeuf_total_conso.to_f / @day_total_conso.to_f * 100).round(2)

    # Consommation de poulet

    @chicken_total_conso = @consos.where(meat_id: Meat.find_by_meat_type('poulet')).pluck(:quantity).sum
    @chicken_percent = (@chicken_total_conso.to_f / @day_total_conso.to_f * 100).round(2)

    # Consommation de porc

    @pork_total_conso = @consos.where(meat_id: Meat.find_by_meat_type('porc')).pluck(:quantity).sum
    @pork_percent = (@pork_total_conso.to_f / @day_total_conso.to_f * 100).round(2)

    # Consommation de mouton

    @sheep_total_conso = @consos.where(meat_id: Meat.find_by_meat_type('sheep')).pluck(:quantity).sum
    @sheep_percent = (@sheep_total_conso.to_f / @day_total_conso.to_f * 100).round(2)

    # Consommation de poisson

    @fish_total_conso = @consos.where(meat_id: Meat.find_by_meat_type('fish')).pluck(:quantity).sum
    @fish_percent = (@fish_total_conso.to_f / @day_total_conso.to_f * 100).round(2)

    @saviez_vous = text_saviez_vous.sample
  end

  def text_saviez_vous
    ["La première cause de déforestation dans le monde est la production animale.",
    "L'élevage bovin est reponsable de 63% de la déforestation de la forêt Amazonienne.",
    "On estime à environ 5m3 d’eau pour la production de 1 000 calories animales quand il en faut seulement 1m3 pour 1 000 calories végétales.",
    "Antibiotiques, produits chimiques, engrais, hormones, et pesticides issus de l'élevage sont retrouvés dans les eaux et les sols.",
    "Les vaches sont des êtres sensibles, qui communiquent avec des vocalisations et leurs corps, et ont une vie sociale riche.",
    "Les poissons et autres produits de la mer contiennent du cadmium, du mercure, de l’arsenic et du chrome. Certains de ces métaux ont des conséquences délétères pour la santé : cancérogènes, neurotoxiques, entraînant des effets osseux, rénaux, cardiovasculaires…",
    "Les poissons et crustacés sont dotés de nocicepteurs : ils ressentent donc aussi la douleur...",
    "En France, 95 % des cochons sont élevés de manière intensive, sans accès à l’extérieur et le plus souvent isolés (truies reproductrices), ou confinés en grand nombre dans de petits espaces (cochons élevés pour leur chair).",
    "En France, la grande majorité des poulets sont enfermés toute leur vie en bâtiment, sans accès à l’extérieur. Les densités atteignent 22 oiseaux par mètre carré dans les élevages standards, soit moins d’une feuille A4 d’espace par poulet...",
    "Les moutons sont très intelligents. Bien plus intelligents que ce qu’on a pu penser. Sur des tâches comparables, leurs performances sont équivalentes à celles d’un singe." ]
  end
end
