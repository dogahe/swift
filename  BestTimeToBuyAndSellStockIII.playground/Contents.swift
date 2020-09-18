/*
  Best Time to Buy and Sell Stock III

 Say you have an array for which the ith element is the price of a given stock on day i.

 Design an algorithm to find the maximum profit. You may complete at most two transactions.

 Note: You may not engage in multiple transactions at the same time (i.e., you must sell the stock before you buy again).

  

 Example 1:
 
 Input: prices = [3,3,5,0,0,3,1,4]
 Output: 6
 Explanation: Buy on day 4 (price = 0) and sell on day 6 (price = 3), profit = 3-0 = 3.
 Then buy on day 7 (price = 1) and sell on day 8 (price = 4), profit = 4-1 = 3.

 Example 2:
 
 Input: prices = [1,2,3,4,5]
 Output: 4
 Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
 Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are engaging multiple transactions at the same time. You must sell before buying again.
 
 Example 3:
 Input: prices = [7,6,4,3,1]
 Output: 0
 Explanation: In this case, no transaction is done, i.e. max profit = 0.
 
 Example 4:
 
 Input: prices = [1]
 Output: 0
 
 Constraints:

 1 <= prices.length <= 10^5
 0 <= prices[i] <= 10^5
 */

// FIX: NOT Correct Yet.
import Foundation

func maxProfit(_ prices: [Int]) -> Int {
    if prices.count < 2 {
        return 0
    }
    var diff: [Int] = []
    var last: Int = prices[0]
    for index in 1..<prices.count {
        let current = prices[index]
        let currDiff = current - last
        last = current
        diff.append(currDiff)
    }
    print(diff)
    var sum: Int = 0
    var positives: [Int] = []
    for index in 0..<diff.count {
        let current = diff[index]
        if current >= 0 {
            sum += current
        } else {
            if sum > 0  {
                positives.append(sum)
            }
            sum = 0
        }
    }
    if sum > 0 {
        positives.append(sum)
    }
    print(positives)
    let sorted = positives.sorted()
    print(sorted)
    if sorted.count == 0 {
        return 0
    } else if sorted.count == 1 {
        return sorted[0]
    } else {
        return sorted[sorted.count - 1] + sorted[sorted.count - 2]
    }
}

//let prices = [3,3,15,0,0,3,1,9]
//let prices = [1, 4, 5, 4, 2, 6, 7, 10, 9]
//let prices = [4, 4, 4]
let prices = [1,2,4,2,5,7,2,4,9,0]
maxProfit(prices)
