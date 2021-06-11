/*
 256. Paint House

 There are a row of n houses, each house can be painted with one of the three colors: red, blue or green. The cost of painting certain color is different. You have to paint all the houses such that no two adjacent houses have the same color.
 
 The cost of painting each house with a certain color is represented by a n x 3 cost matrix. For example, costs[0][0] is the cost of painting house 0 with color red, costs[1][2] is the cost of painting house with color green, and so on... Find the minimum cost to paint houses

 Note:

 All costs are positive integers

 Example:

 Input: [[17,2,17],[16,16,5],[14,3,19]]

 Output: 18

 Explanation: Paint house 0 into blue, paint house 1 into green, paint house 2 into blue. Minimum cost: 2 + 5 + 3 = 10.

 */

func paintHouse(_ cost: [[Int]]) -> Int {
    let m = cost.count
    let n = cost[0].count
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: m)
    
    dp[0][0] = cost[0][0]
    dp[0][1] = cost[0][1]
    dp[0][2] = cost[0][2]
    
    for i in 1 ..< m {
        dp[i][0] = cost[i][0] + min(dp[i - 1][1], dp[i - 1][2])
        dp[i][1] = cost[i][1] + min(dp[i - 1][0], dp[i - 1][2])
        dp[i][2] = cost[i][2] + min(dp[i - 1][0], dp[i - 1][1])
    }
    
    return [dp[m - 1][0], dp[m - 1][1], dp[m - 1][2]].min()!
}

let cost = [[1, 2, 3], [1, 5, 10], [3, 2, 1]]//[[17,2,17],[16,16,5],[14,3,19]]

print(paintHouse(cost))



/*
 
265. Paint House II
 
There are a row of n houses, each house can be painted with one of the k colors. The cost of painting each house with a certain color is different. You have to paint all the houses such that no two adjacent houses have the same color.

The cost of painting each house with a certain color is represented by a n x k cost matrix. For example, costs[0][0] is the cost of painting house 0 with color 0; costs[1][2] is the cost of painting house 1 with color 2, and so on... Find the minimum cost to paint all houses.

Note:
All costs are positive integers.

Example:

Input: [[1,5,3],[2,9,4]]
Output: 5
Explanation: Paint house 0 into color 0, paint house 1 into color 2. Minimum cost: 1 + 4 = 5;
             Or paint house 0 into color 2, paint house 1 into color 0. Minimum cost: 3 + 2 = 5.
Follow up:
Could you solve it in O(nk) runtime?
 
 */


func paintHouseII(_ cost: [[Int]]) -> Int {
    let m = cost.count
    let n = cost[0].count
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: m)
    
    for i in 0 ..< n {
        dp[0][i] = cost[0][i]
    }
    
    for i in 1 ..< m {
        for j in 0 ..< n {
            var arr = dp[i - 1]
            arr.remove(at: j)
            dp[i][j] = cost[i][j] + arr.min()!
        }
    }
    return dp[m - 1].min()!
}

let costII = [[1,5,3,2,6,7],[2,9,4,1,3,5],[3,9,4,2,3,5]]

print(paintHouseII(costII))
