class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about ]

  def home
  end

  def dashboard
    @assos = Asso.all
    @consos = current_user.consos
    @days = Day.where(user_id: current_user.id)
    @seven_days = @days.last(7)
    @last_day = @days.last

    # Consommation de boeuf
    # @days.where(user.id == current_user.id)

    @beef_total_conso = @consos.where(meat_id: Meat.find_by_meat_type('boeuf')).pluck(:quantity).sum
    @user_total_conso = @consos.pluck(:quantity).sum
    @beef_percent = (@beef_total_conso.to_f / @user_total_conso.to_f * 100).round(2)

    # Consommation de poulet

    @chicken_total_conso = @consos.where(meat_id: Meat.find_by_meat_type('poulet')).pluck(:quantity).sum
    @user_total_conso = @consos.pluck(:quantity).sum
    @chicken_percent = (@chicken_total_conso.to_f / @user_total_conso.to_f * 100).round(2)

    # Consommation de porc

    @pork_total_conso = @consos.where(meat_id: Meat.find_by_meat_type('porc')).pluck(:quantity).sum
    @user_total_conso = @consos.pluck(:quantity).sum
    @pork_percent = (@pork_total_conso.to_f / @user_total_conso.to_f * 100).round(2)

    # Consommation de mouton

    @sheep_total_conso = @consos.where(meat_id: Meat.find_by_meat_type('mouton')).pluck(:quantity).sum
    @user_total_conso = @consos.pluck(:quantity).sum
    @sheep_percent = (@sheep_total_conso.to_f / @user_total_conso.to_f * 100).round(2)

    # Consommation de poisson

    @fish_total_conso = @consos.where(meat_id: Meat.find_by_meat_type('poisson')).pluck(:quantity).sum
    @user_total_conso = @consos.pluck(:quantity).sum
    @fish_percent = (@fish_total_conso.to_f / @user_total_conso.to_f * 100).round(2)

    # Cards

    @water_impact_dashboard = water_impact_calculator
    @carbon_impact_dashboard = carbon_impact_calculator
    @tree_impact_dashboard = tree_impact_calculator
    @pollution_impact_dashboard = pollution_impact_calculator

    # Le Savez-Vous ?

    @saviez_vous = text_saviez_vous.sample

    # API
    # def import

    # require "open-uri"
    # require "nokogiri"

    # url = "https://freethepickle.fr/?s=végétarien"

    # html_file = URI.open(url).read
    # html_doc = Nokogiri::HTML(html_file)

    # html_doc.search(".standard-card-new__article-title").each do |element|
    #   puts element.text.strip
    #   puts element.attribute("href").value
    # end
  # end

  # def import

  #   url = "https://freethepickle.fr/?s=végétarien"

  #   html_file = URI.open(url).read
  #   html_doc = Nokogiri::HTML(html_file)

  #   recipes = []

  #   html_doc.search(".entry-content").first(5).each do |element|
  #     path = element.search(".img-responsive wp-post-image jetpack-lazy-image jetpack-lazy-image--handled").attribute("href").value
  #     name = nil
  #     description = nil
  #     html_doc2.search("h1").each { |titre| name = titre.text.strip }
  #     html_doc2.search(".editor-content.mt-sm.pr-xxs.hidden-print").each do |paragraph|
  #       description = paragraph.text.strip
  #     end
  #     recipes << Recipe.new(name, description)
  #   end
  # end
  end

  private

    # Algorithme Cards

  def water_impact_calculator
    water_impact_dashboard = 0
    @consos.each do |conso|
      # conso.meat.water_impact
      # conso.quantity
      water_impact_dashboard += (conso.quantity * conso.meat.water_impact) / 1000
    end
    return water_impact_dashboard.round(2)
  end

  def carbon_impact_calculator
    carbon_impact_dashboard = 0
    @consos.each do |conso|
      # conso.meat.carbon_impact
      # conso.quantity
      carbon_impact_dashboard += (conso.quantity * conso.meat.carbon_impact) / 1000
    end
    return carbon_impact_dashboard.round(2)
  end

  def tree_impact_calculator
    tree_impact_dashboard = 0
    @consos.each do |conso|
      # conso.meat.tree_impact
      # conso.quantity
      tree_impact_dashboard += (conso.quantity * conso.meat.tree_impact) / 1000
    end
    return tree_impact_dashboard.round(2)
  end

  def pollution_impact_calculator
    pollution_impact_dashboard = 0
    @consos.each do |conso|
      # conso.meat.pollution_impact
      # conso.quantity
      pollution_impact_dashboard += (conso.quantity * conso.meat.pollution_impact) / 1000
    end
    return pollution_impact_dashboard.round(2)
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
