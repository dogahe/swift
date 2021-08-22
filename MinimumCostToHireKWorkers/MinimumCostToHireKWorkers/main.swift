//
//  main.swift
//  MinimumCostToHireKWorkers
//
//  Created by Behzad Dogahe on 8/22/21.
//

func mincostToHireWorkers(_ quality: [Int], _ wage: [Int], _ k: Int) -> Double {
    var minSum = Double(Int.max)
    for i in 0 ..< quality.count {
        let factor = Double(wage[i])/Double(quality[i])
        var prices: [Double] = []
        for j in 0 ..< quality.count {
            let price = Double(quality[j]) * factor
            if price < Double(wage[j]) {
                continue
            }
            prices.append(price)
        }
        if prices.count < k {
            continue
        }
        prices.sort()
        let sum = prices.prefix(k).reduce(0, +)
        minSum = min(minSum, sum)
    }
    return minSum
}

let quality = [10,20,5], wage = [70,50,30], k = 2
print(mincostToHireWorkers(quality, wage, k))
