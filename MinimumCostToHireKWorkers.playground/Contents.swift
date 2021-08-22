/*
 
 tags:Google
 
 857. Minimum Cost to Hire K Workers
 
 There are n workers. You are given two integer arrays quality and wage where quality[i] is the quality of the ith worker and wage[i] is the minimum wage expectation for the ith worker.

 We want to hire exactly k workers to form a paid group. To hire a group of k workers, we must pay them according to the following rules:

 Every worker in the paid group should be paid in the ratio of their quality compared to other workers in the paid group.
 Every worker in the paid group must be paid at least their minimum-wage expectation.
 Given the integer k, return the least amount of money needed to form a paid group satisfying the above conditions. Answers within 10-5 of the actual answer will be accepted.

 Example 1:
 Input: quality = [10,20,5], wage = [70,50,30], k = 2
 Output: 105.00000
 Explanation: We pay 70 to 0th worker and 35 to 2nd worker.
 Example 2:

 Input: quality = [3,1,10,10,1], wage = [4,8,2,2,7], k = 3
 Output: 30.66667
 Explanation: We pay 4 to 0th worker, 13.33333 to 2nd and 3rd workers separately.
  
 Constraints:

 n == quality.length == wage.length
 1 <= k <= n <= 104
 1 <= quality[i], wage[i] <= 104
 */

// FIX: Needs more work
// Not efficient to pass the larger test cases
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
mincostToHireWorkers(quality, wage, k)

let quality2 = [3,1,10,10,1], wage2 = [4,8,2,2,7], k2 = 3
mincostToHireWorkers(quality2, wage2, k2)
