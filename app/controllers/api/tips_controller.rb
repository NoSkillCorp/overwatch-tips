class Api::TipsController < ApplicationController

    def random
        random_tip = Tip.random
        render json: random_tip
    end
end
