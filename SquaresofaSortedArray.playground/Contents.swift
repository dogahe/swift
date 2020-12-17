import Foundation

func sortedSquares(_ nums: [Int]) -> [Int] {
    var squared: [Int] = []
    for num in nums {
        squared.append(num * num)
    }
    return squared.sorted()
}

func sortedSquaresEfficient(_ nums: [Int]) -> [Int] {
    var squared: [Int] = []
    var left = 0
    var right = nums.count - 1
    while left <= right  {
        let  l = nums[left]
        let r = nums[right]
        if abs(l) <= abs(r) {
            squared.insert(r * r, at: 0)
            print(squared)
            right -= 1
        } else {
            squared.insert(l * l, at: 0)
            print(squared)
            left += 1
        }
    }
    return squared
}


let nums = [-7,-3,2,3,11]

sortedSquaresEfficient(nums)
