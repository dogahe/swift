import Foundation

func findPairs(_ nums: [Int], _ k: Int) -> Int {
    var dict: [Int: Int] = [:]
    nums.forEach { num in
        if dict[num] != nil {
            dict[num] =  dict[num]! + 1
        } else {
            dict[num] = 1
        }
    }
    var sum: Int = 0
    dict.forEach { (num, repetition) in
        if dict[num + k] != nil {
            let rep = dict[num + k]!
            if k == 0 {
                if rep > 1 {
                    sum += 1
                }
            } else {
                sum += 1
            }
        }
    }
    return sum
}

let nums = [-1,-2,-3]
let k = 1

findPairs(nums, k)
