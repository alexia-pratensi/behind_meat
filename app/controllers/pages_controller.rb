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

    # API

  # require "json"
  # require "open-uri"

  # url = "https://api.spoonacular.com/recipes/complexSearch?query=vegetarian&number=25&apiKey=40dc8421c5b54e84bbfbdea1ab9fc773&includeNutrition=true.&diet=vegetarian&addRecipeInformation=true"
  # recipes_serialized = URI.open(url).read
  # recipes = JSON.parse(recipes_serialized)

  # recipe = recipes['results'].sample
  # # image = recipe['image']

  # @recipe_api = {
  #   title: recipe['title'],
  #   summary: recipe['summary'],
  #   source_url: recipe['sourceUrl'],
  #   image: recipe['image']
  # }

  # title =

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


end
