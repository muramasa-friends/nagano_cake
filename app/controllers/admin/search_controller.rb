class Admin::SearchController < ApplicationController

  def search
    @model = params["search"]["model"]
    @value = params["search"]["value"]
    @datas = search_for(@model, @value).order(created_at: :asc).page(params[:page]).per(10)
  end


  def match(model, value)
    if model == 'customer'
      if value.include?(' ') || value.include?('　')
        value = value.tr('　', ' ') if value.include?('　')
        last_name, first_name = value.split(' ')
        value = Customer.where('last_name LIKE ? AND first_name LIKE ?', "%#{last_name}%", "%#{first_name}%")
      else
        value = Customer.where("last_name LIKE ?", "%#{value}%").or(Customer.where("first_name LIKE ?", "%#{value}%"))
      end
    elsif model == 'item'
      Item.where("name LIKE ?", "%#{value}%")
    else
      @genre = Genre.where("name LIKE ?", "%#{value}%")
      value = Item.where(genre_id: @genre)
    end
  end

  def search_for(model, value)
      match(model, value)
  end

end
