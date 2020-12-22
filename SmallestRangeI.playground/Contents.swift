import Foundation

func smallestRangeI(_ A: [Int], _ K: Int) -> Int {
    let B = A.sorted()
    let minVal = B.first!
    let maxVal = B.last!
    return max(0, maxVal - minVal - 2*K)
}

let A = [1, 3, 6]
let K = 3
smallestRangeI(A, K)
