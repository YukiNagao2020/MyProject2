class SearchesController < ApplicationController
  def search
    @model = params["search"]["model"]
    @value = params["search"]["value"]
    @how = params["search"]["how"]  
    @datas = search_for(@how, @model, @value)     
  end

  private

  def match(model, value)                     
    if model == 'user'                      
      User.where(name: value)
    elsif model == 'post'
      Post.where(title: value)
    end
  end

  def partial(model, value)
    if model == 'user'
      User.where("name LIKE ?", "%#{value}%")
    elsif model == 'post'
      Post.where("title LIKE ?", "%#{value}%")
    end
  end

  def search_for(how, model, value)
    case how                             
    when 'match'
      match(model, value)                 
    when 'partial'
      partial(model, value)
    end
  end
end
