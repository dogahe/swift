//
//  main.swift
//  BalancedSplit
//
//  Created by Behzad Dogahe on 5/11/21.
//

/*
 
 tags:Facebook
 
 Balanced Split
 Given an array of integers (which may include repeated integers), determine if there's a way to split the array into two subsequences A and B such that the sum of the integers in both arrays is the same, and all of the integers in A are strictly smaller than all of the integers in B.
 Note: Strictly smaller denotes that every integer in A must be less than, and not equal to, every integer in B.
 Signature
 bool balancedSplitExists(int[] arr)
 Input
 All integers in array are in the range [0, 1,000,000,000].
 Output
 Return true if such a split is possible, and false otherwise.
 Example 1
 arr = [1, 5, 7, 1]
 output = true
 We can split the array into A = [1, 1, 5] and B = [7].
 Example 2
 arr = [12, 7, 6, 7, 6]
 output = false
 We can't split the array into A = [6, 6, 7] and B = [7, 12] since this doesn't satisfy the requirement that all integers in A are smaller than all integers in B.
 
 */
private extension Array where Element == Int {
    var hasBalancedSplit: Bool {
        let total = self.reduce(0, +)
        if total % 2 != 0 {
            return false
        }
        let half = total / 2
        let sa = self.sorted()
        var sum: Int = 0
        for i in 0 ..< sa.count {
            sum += sa[i]
            if sum == half {
                if sa[i] != sa[i + 1] {
                    return true
                } else {
                    return false
                }
            }
        }
        return false
    }
}

// These are the tests we use to determine if the solution is correct.
// You can add your own at the bottom, but they are otherwise not editable!

var testCaseNumber = 1

private func check(_ expectedValue: Bool, matches output: Bool) {
    let rightTick = "\u{2713}"
    let wrongTick = "\u{2717}"
    
    let result = expectedValue == output
    if result {
        print("\(rightTick) Test #\(testCaseNumber)")
    } else {
        print("\(wrongTick) Test #\(testCaseNumber) Expected: \(expectedValue) Your output: \(output)")
    }
    testCaseNumber += 1
}

let arr1 = [2, 1, 5, 2]
check(true, matches: arr1.hasBalancedSplit)

let arr2 = [3, 6, 3, 4, 4]
check(false, matches: arr2.hasBalancedSplit)

// Add your own test cases here
