/*
 Pascal's Triangle II

 Given an integer rowIndex, return the rowIndexth row of the Pascal's triangle.

 Notice that the row index starts from 0.
 
 In Pascal's triangle, each number is the sum of the two numbers directly above it.

 Follow up:
 // TODO
 Could you optimize your algorithm to use only O(k) extra space?
 
 Input: rowIndex = 3
 Output: [1,3,3,1]
 
 Input: rowIndex = 1
 Output: [1,1]
 
 Input: rowIndex = 0
 Output: [1]
 
 Constraints:

 0 <= rowIndex <= 40
 
 */
import UIKit

func getRow(_ rowIndex: Int) -> [Int] {
    if rowIndex == 0 {
        return [1]
    }
    let prev = getRow(rowIndex - 1)
    var next: [Int] = []
    var last: Int = 0
    for index in 0..<prev.count {
        let val = last + prev[index]
        next.append(val)
        last = prev[index]
    }
    next.append(1)
    return next
}

getRow(2)


