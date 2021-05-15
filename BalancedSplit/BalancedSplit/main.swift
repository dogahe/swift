//
//  main.swift
//  BalancedSplit
//
//  Created by Behzad Dogahe on 5/11/21.
//

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


let arr1 = [2, 1, 5, 2]
print(arr1.hasBalancedSplit)

let arr2 = [3, 6, 3, 4, 4]
print(arr2.hasBalancedSplit)
