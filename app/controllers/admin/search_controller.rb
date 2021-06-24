class Admin::SearchController < ApplicationController

  def search
    @model = params["search"]["model"]
    @value = params["search"]["value"]
    @datas = search_for(@model, @value).order(created_at: :asc).page(params[:page]).per(10)
  end

  def match(model, value)
    if model == 'customer'
      Customer.where(last_name: value).or(Customer.where(first_name: value))
    elsif model == 'item'
      Item.where(name: value)
    else
      @genre = Genre.where(name: value)
      value = Item.where(genre_id: @genre)
    end
  end

  def search_for(model, value)
      match(model, value)
  end

end
