class Api::ItemsController < ApplicationController

    #Returns the list of elements and their properties
    def index 
        @items = Item.all
        @list = @items.map do |item| 
            {id: item.id,
             code: item.code, 
             name: item.name, 
             price: num_to_price(item.price)}
        end
        json_response(@list)
    end

    #Updates item price if the parameters are correctly parsed
    #Parameters: {id: Integer, price: Positive Integer}
    def update

        if params[:price].match(/[€.]/)
            json_error('Price must be expressed in cents and without symbols', 422) 
            return
        end

        if params[:price].to_f <= 0
            json_error('Price must be a positive number', 422)
            return 
        end 

        @item = Item.find(params[:id])
        if @item
           if @item.update(price: params[:price])
            price = num_to_price(params[:price])
            json_response("#{@item.code} updated to #{ price }")
           else 
            json_error('Something went wrong', 402)
           end
        else
            json_error('Item does not exist', 422)
        end
    end

    # Allows to check the total value of a list of items
    # Parameters: cart: Array of item codes
    def cart
        @total = 0

        cart = {}
        error = false
        params[:cart].each do |item|
                if cart[item]
                    cart[item] += 1
                else
                    if(Item.find_by(code: item))
                        cart[item] = 1
                    else
                        error = true
                    end
                end 
            end

        cart.each do |key, value|
           @total += Item.find_by(code: key).price * value
        end
        unless error
            json_response({cart: cart ,total: num_to_price(@total)})
        else
            json_error({error:"One or many codes are invalid"}, 422)
        end
    end

    private

    def num_to_price i
        "€#{sprintf('%.2f',i.to_f / 100)}"
    end

end