import Foundation

public typealias Supply = (weight: Int, value: Int)

public final class Knapsack {
    let maxWeight: Int
    let drinks: [Supply]
    let foods: [Supply]
    var maxKilometers: Int {
        findMaxKilometres()
    }
    
    init(_ maxWeight: Int, _ foods: [Supply], _ drinks: [Supply]) {
        self.maxWeight = maxWeight
        self.drinks = drinks
        self.foods = foods
    }
    
    func findMaxKilometres() -> Int {
        
        var foodAndDrinkArray = Array<Array<Int>>()
        var bestDistanse = 0
        let distancesArray = Array<Int>()
        
        for food in foods {
            for drink in drinks {
                if (food.weight + drink.weight) <= maxWeight {
                    var tmpFoodAndDrink = Array<Int>()
//                    tmpFoodAndDrink.append(food.weight)
                    tmpFoodAndDrink.append(food.value)
//                    tmpFoodAndDrink.append(drink.weight)
                    tmpFoodAndDrink.append(drink.value)
                    foodAndDrinkArray.append(tmpFoodAndDrink)
                }
            }
        }
        
        print(foodAndDrinkArray)
        
        var tmpArray = Array<Int>()
        
        for i in foodAndDrinkArray {
            for _ in i {
                tmpArray.append(i.min()!)
            }
        }
        
        
        print(distancesArray)
        
        bestDistanse = tmpArray.max() ?? 0
       
        
        return bestDistanse
    }
}
