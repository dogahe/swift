/*
 Numbers can be regarded as product of its factors.

 For example,

 8 = 2 x 2 x 2

 8 = 2 x 4.

 Write a function that takes an integer n and return all possible combinations of its factors.

 Note:

 1. You may assume that n is always positive.
 2. Factors should be greater than 1 and less than n.

 Example 1:

 Input: 1

 Output: []

 Example 2:

 Input: 37
 
 Output: []
 
 Input: 12
 
 Output: [
 [2, 6],
 [2, 2, 3],
 [3, 4]
 ]
 
 
 */

func getFactors(_ n: Int) -> [[Int]] {
    var output: [[Int]] = []
    getFactors(n, [], 1, 2, &output)
    return output
}

func getFactors(_ n: Int, _ curr: [Int], _ currentProduct: Int, _ index: Int, _ output: inout [[Int]]) {
    
    if currentProduct > n {
        return
    }
    if currentProduct == n {
        output.append(curr)
        return
    }
    
    for i in index ... n/2 {
        if i * currentProduct > n {
            break
        }
        if n % i == 0 {
            var newCurr = curr
            newCurr.append(i)
            getFactors(n, newCurr, currentProduct * i, i, &output)
        }
    }
}

let results = getFactors(16)
print(results)
print(results.count)
