/*
Given an array of integers, sort the array according to frequency of elements. That is elements that have higher frequency come first. If frequencies of two elements are same, then smaller number comes first.

*/

func frequencySort(_ nums: [Int]) -> [Int] {
    var dict: [Int: Int] = [:]
    for num in nums {
        if let val = dict[num] {
            dict[num] = val + 1
        } else {
            dict[num] = 1
        }
    }
    var arr: [(Int, Int)] = []
    for (_, (key, value)) in dict.enumerated() {
        arr.append((key, value))
    }
    let sortedArr = arr.sorted { a, b in
        if a.1 > b.1 {
            return true
        } else {
            if a.1 == b.1 {
                if a.0 < b.0 {
                    return true
                }
            }
        }
        return false
    }
    var output: [Int] = []
    for elem in sortedArr {
        for _ in 0 ..< elem.1 {
            output.append(elem.0)
        }
    }
    return output
}

var nums = [4, 5, 6, 6, 6, 4, 3, 2, 1, 3, 3]
let fs = frequencySort(nums)
print(fs)

