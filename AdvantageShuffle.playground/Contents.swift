/*
 870. Advantage Shuffle
 
 Given two arrays A and B of equal size, the advantage of A with respect to B is the number of indices i for which A[i] > B[i].

 Return any permutation of A that maximizes its advantage with respect to B.

 Example 1:

 Input: A = [2,7,11,15], B = [1,10,4,11]
 Output: [2,11,7,15]
 Example 2:

 Input: A = [12,24,8,32], B = [13,25,32,11]
 Output: [24,32,8,12]
  

 Note:

 1 <= A.length = B.length <= 10000
 0 <= A[i] <= 10^9
 0 <= B[i] <= 10^9
 
 */
import Foundation

func advantageCount(_ A: [Int], _ B: [Int]) -> [Int] {
    let sA = A.sorted()
    let sB = B.sorted()
    var dict: [Int: [Int]] = [:]
    var remaining: [Int] = []
    var j: Int = 0
    for a in sA {
        if a > sB[j] {
            if let arrA =  dict[sB[j]] {
                var newArrA = arrA
                newArrA.append(a)
                dict[sB[j]] = newArrA
            } else {
                dict[sB[j]] = [a]
            }
            j += 1
        } else {
            remaining.append(a)
        }
    }
    var result: [Int] = []
    for b in B {
        if let arrA = dict[b] {
            if arrA.count > 0 {
                var newArrA = arrA
                let a = newArrA.popLast()
                dict[b] = newArrA
                result.append(a!)
            } else {
                result.append(remaining.popLast()!)
            }
        } else {
            result.append(remaining.popLast()!)
        }
    }
    return result
}

// let A = [2,7,11,15]
// let B = [1,10,4,11]

// let A = [12,24,8,32]
// let B = [13,25,32,11]

//let A = [2,0,4,1,2]
//let B = [1,3,0,0,2]

let A = [28,47,45,8,2,10,25,35,43,37,33,30,33,20,33,42,43,36,34,3,16,23,15,10,19,42,13,47,0,21,36,38,0,5,3,28,4,20,14,5,19,22,29,17,3,16,35,0,26,0]

let B  = [44,10,27,4,27,40,46,40,45,0,41,2,44,50,36,30,37,4,44,4,12,13,35,20,19,25,38,42,43,14,2,4,5,38,4,38,0,35,12,32,38,33,3,1,19,46,23,13,24,41]
A.count
B.count
advantageCount(A, B)
