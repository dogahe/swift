//
//  main.swift
//  CoinChange
//
//  Created by Behzad Dogahe on 5/9/21.
//

/*
 
 322. Coin Change
 
 You are given an integer array coins representing coins of different denominations and an integer amount representing a total amount of money.

 Return the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.

 You may assume that you have an infinite number of each kind of coin.

  

 Example 1:

 Input: coins = [1,2,5], amount = 11
 Output: 3
 Explanation: 11 = 5 + 5 + 1
 Example 2:

 Input: coins = [2], amount = 3
 Output: -1
 Example 3:

 Input: coins = [1], amount = 0
 Output: 0
 Example 4:

 Input: coins = [1], amount = 1
 Output: 1
 Example 5:

 Input: coins = [1], amount = 2
 Output: 2
  

 Constraints:

 1 <= coins.length <= 12
 1 <= coins[i] <= 231 - 1
 0 <= amount <= 104
 
 
*/
func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    var sols: [Int] = Array(repeating: Int.max, count: amount + 1)
    sols[0] = 0
    if amount < 1 {
        return 0
    }
    for i in 1 ... amount {
        var sol = sols[i]
        for j in coins {
            if j <= i {
                if sols[i - j] < Int.max {
                    sol = min(sol, sols[i - j] + 1)
                }
            }
        }
        sols[i] = sol
    }
    if sols[amount] == Int.max {
        return -1
    }
    return sols[amount]
}

let coins = [1,3,5]
let amount = 11
print(coinChange(coins, amount))
