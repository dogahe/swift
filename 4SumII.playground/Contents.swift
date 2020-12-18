import Foundation

func fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
    var AB: [Int] = []
    var CD: [Int] = []
    for i in 0 ..< A.count {
        for j in 0 ..< B.count {
            AB.append(A[i] + B[j])
        }
    }
    
    for i in 0 ..< C.count {
        for j in 0 ..< D.count {
            CD.append(C[i] + D[j])
        }
    }
    
    var dict: [Int:Int] = [:]
    
    for i in 0 ..< AB.count {
        if let val = dict[AB[i]] {
            dict[AB[i]] = val + 1
        } else {
            dict[AB[i]] = 1
        }
    }
    
    var sum = 0
    for i in 0 ..< CD.count {
        if let val = dict[-1*CD[i]] {
            sum += val
        }
    }
    return sum
}

let A = [ 1, 2]
let B = [-2,-1]
let C = [-1, 2]
let D = [ 0, 2]
fourSumCount(A, B, C, D)
