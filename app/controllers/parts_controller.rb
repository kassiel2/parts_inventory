class PartsController < ApplicationController
  around_filter :shopify_session
  respond_to :html, :js
  before_action :all_traits

  def parts
    @products = ShopifyAPI::Product.find(:all, :params => {:limit => 5})
    @product = ShopifyAPI::Product.find(377267245)
    @parts = 'hello this is where parts inventory will go'
  end

  def traits
    @traits = Trait.all
    render 'traits'
    # @traits = ['trait1', 'trait2']
  end

  def options
    @trait = Trait.find_by(name: params['trait-name-textfield'])
    @options = Option.find_by(trait_id: @trait.id)
    @option_names = @options.map { |option| option.name } unless @options.nil?
    render 'add_trait'
  end

  def add_trait
    @trait = Trait.create(name: params['trait-name-textfield'])
    @options = Option.find_by(trait_id: @trait.id)
    @option_names = @options.map { |option| option.name } unless @options.nil?
    puts @options
  end

  def add_option

  end

  private

  def all_traits
    @traits = Trait.all
    @trait_names = @traits.map { |trait| trait.name } unless @traits.nil?
  end
end
