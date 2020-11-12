/*
 Valid Square
 
 Given the coordinates of four points in 2D space, return whether the four points could construct a square.

 The coordinate (x,y) of a point is represented by an integer array with two integers.

 Example:

 Input: p1 = [0,0], p2 = [1,1], p3 = [1,0], p4 = [0,1]
 Output: True
  

 Note:

 All the input integers are in the range [-10000, 10000].
 A valid square has four equal sides with positive length and four equal angles (90-degree angles).
 Input points have no order.
 */

import Foundation

func validSquare(_ p1: [Int], _ p2: [Int], _ p3: [Int], _ p4: [Int]) -> Bool {
    
    let l12s = pow(Decimal(p1[0] - p2[0]), 2) + pow(Decimal(p1[1] - p2[1]), 2)
    let l13s = pow(Decimal(p1[0] - p3[0]), 2) + pow(Decimal(p1[1] - p3[1]), 2)
    let l14s = pow(Decimal(p1[0] - p4[0]), 2) + pow(Decimal(p1[1] - p4[1]), 2)
    
    if l12s == l13s && l14s == 2 * l12s {
        if inner(p1, p2, p3) == 0 {
            let a = inner(p1, p2, p4)
            let b = inner(p1, p3, p4)
            if (abs(a - sqrt(0.5)) < 0.00001) && (abs(b - sqrt(0.5))  < 0.00001) {
                return true
            }
        }
    } else if l12s == l14s && l13s == 2 * l12s {
        if inner(p1, p2, p4) == 0 {
            let a = inner(p1, p3, p2)
            let b = inner(p1, p3, p4)
            if (abs(a - sqrt(0.5)) < 0.00001) && (abs(b - sqrt(0.5))  < 0.00001) {
                return true
            }
        }
    } else if l13s == l14s && l12s == 2 * l13s {
        if inner(p1, p3, p4) == 0 {
            let a = inner(p1, p3, p2)
            let b = inner(p1, p4, p2)
            if (abs(a - sqrt(0.5)) < 0.00001) && (abs(b - sqrt(0.5))  < 0.00001) {
                return true
            }
        }
    }
    return false
}

func inner(_ p1: [Int], _ p2: [Int], _ p3: [Int]) -> Double {
    let v1 = [p1[0] - p2[0], p1[1] - p2[1]]
    let v2 = [p1[0] - p3[0], p1[1] - p3[1]]
    let a = (v1[0] * v2[0] + v1[1] * v2[1])
    let b = sqrt(Double(v1[0]*v1[0] + v1[1]*v1[1]))
    let c = sqrt(Double(v2[0]*v2[0] + v2[1]*v2[1]))
    let inn = Double(a) / ( b * c )
    return inn
}


let p1 = [1,1]
let p2 = [0,1]
let p3 = [1,2]
let p4 = [0,0]

print(validSquare(p1, p2, p3, p4))
