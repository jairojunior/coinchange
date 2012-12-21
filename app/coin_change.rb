class CoinChange

  @@avaiable_coins = [1, 5, 10, 25, 100]
  @@empty_change = @@avaiable_coins.inject({}) { |result, coin| result.merge({coin => 0}) }

  def change_for amount
    if amount == 0
      @@empty_change
    else
      biggest_change = biggest_single_coin_change amount
      remainder_value = amount - biggest_change

      change_for(remainder_value).merge({biggest_change => 1}) { |key, oldValue, newValue| oldValue + newValue }
    end
  end

  private

  def biggest_single_coin_change amount
    @@avaiable_coins.select { |key| key <= amount }.max
  end

end