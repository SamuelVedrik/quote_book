class QuotesController < ApplicationController
    def index
        @quote = Quote.get_random
        redirect_to action: :show, id: @quote.id
    end

    def show
        @quote = Quote.find(params[:id])
        @image = Quote.random_image
        @left, @top = Quote.loc
    end
end
