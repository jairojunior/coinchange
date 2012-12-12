class CoinChange

    def initialize
        @avaiableCoins = [1,5,10,25,100]
        @emptyChange = @avaiableCoins.inject({}) { |result, coin| result.merge({coin => 0})}
    end

    def change_for amount
        if amount == 0
            @emptyChange
        else
            biggestChange = biggest_single_coin_change amount
            remainderValue = amount - biggestChange

            change_for(remainderValue).merge({biggestChange => 1}) { |key, oldValue, newValue| oldValue + newValue}
        end
    end

    private

    def biggest_single_coin_change amount
        @avaiableCoins.select { |key| key <= amount}.max
    end

end