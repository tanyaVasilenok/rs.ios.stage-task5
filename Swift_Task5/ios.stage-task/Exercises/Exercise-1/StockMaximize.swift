import Foundation

class StockMaximize {

    func countProfit(prices: [Int]) -> Int {
        
        //check on border values
        if prices.isEmpty { return 0 }
        if prices.count == 1 { return 0 }
        
        var profit = 0
        var mutablePrices = prices
        var lastValue = mutablePrices.last
        
        mutablePrices.removeLast()
        
        //take the last element and compare it to each before
        for share in mutablePrices.reversed() {
            
            if share > lastValue! {
                lastValue = mutablePrices.last
            }
                
            if share < lastValue! {
                profit += lastValue! - share
                mutablePrices.removeLast()
            }
        }
        
        return profit
    }
}
