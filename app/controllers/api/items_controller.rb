class Api::ItemsController < ApplicationController

    #Returns the list of elements and their properties
    def index 
        @items = Item.all
        @list = @items.map do |item| 
            {id: item.id
             code: item.code, 
             name: item.name, 
             price: "€#{sprintf('%.2f',item.price.to_f / 100)}"}
        end
        json_response(@list)
    end

end