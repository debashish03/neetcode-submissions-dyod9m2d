class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var minPrice: Int = Int.max
        var maxProfit: Int = 0

        for price in prices {
            if price < minPrice {
                minPrice = price
            } else {
                let profit = price - minPrice
                
                if profit > maxProfit {
                    maxProfit = profit
                }
            }
        }

        return maxProfit
    }
}
