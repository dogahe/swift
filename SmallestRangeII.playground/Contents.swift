import Foundation

func smallestRangeII(_ A: [Int], _ K: Int) -> Int {
    let B = A.sorted()
    var minSoFar = B.last! - B.first!
    
    for i in 0 ..< B.count - 1 {
        let a = B[i] + K
        let b = B[i+1] - K
        let minVal = min(B[0] + K, b)
        let maxVal = max(a, B[B.count - 1] - K)
        minSoFar = min(minSoFar, maxVal - minVal)
    }
    return minSoFar
}

let A = [0, 10]
let K = 2

smallestRangeII(A, K)
