//
//  main.swift
//  MaximumSwap
//
//  Created by Behzad Dogahe on 6/20/21.
//

/*
 
 670. Maximum Swap
 
 You are given an integer num. You can swap two digits at most once to get the maximum valued number.

 Return the maximum valued number you can get.

 Example 1:
 Input: num = 2736
 Output: 7236
 Explanation: Swap the number 2 and the number 7.
 
 Example 2:
 Input: num = 9973
 Output: 9973
 Explanation: No swap.
  
 Constraints:

 0 <= num <= 108
 
 */
func maximumSwap(_ num: Int) -> Int {
    var number = num
    var digits: [Int] = []
    while number >= 10 {
        let dig = number % 10
        digits.insert(dig, at: 0)
        number /= 10
    }
    if number > 0 {
        digits.insert(number, at: 0)
    }
    var left = 0
    var right = 1
    var currMax = digits[left]
    var maxIndex = left
    while left < digits.count - 1 {
        while right < digits.count {
            if digits[right] >= currMax {
                currMax = digits[right]
                maxIndex = right
            }
            right += 1
        }
        if maxIndex > left && digits[maxIndex] > digits[left] {
            digits[maxIndex] = digits[left]
            digits[left] = currMax
            break
        } else {
            left += 1
            currMax = digits[left]
            right = left + 1
        }
    }
    var output = 0
    for digit in digits {
        output = (10 * output) + digit
    }
    return output
}

let num = 2736
print(maximumSwap(num))

let num2 = 9973
print(maximumSwap(num2))

let num3 = 98368
print(maximumSwap(num3))

let num4 = 1993
print(maximumSwap(num4))

let num5 = 98368
print(maximumSwap(num5))

let num6 = 10909091
print(maximumSwap(num6))


