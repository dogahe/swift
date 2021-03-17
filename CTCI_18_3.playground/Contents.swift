/*
 
 Write a method to randomly generate a set of m integers from an array of size n. Each element must have equal probability of being chosen.
 
 */

import Foundation

func generate(_ arr: [Int], _ m: Int) -> [Int] {
    var shuffled = arr
    for i in 0 ..< m {
        let rand = Int.random(in: i ..< shuffled.count)
        let temp = shuffled[rand]
        shuffled[rand] = shuffled[i]
        shuffled[i] = temp
    }
    return Array(shuffled.prefix(m))
}

let arr = Array(1...52)

let chosen = generate(arr, 26)

