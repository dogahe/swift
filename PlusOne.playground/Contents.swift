/*
 66. Plus One
 
 Given a non-empty array of decimal digits representing a non-negative integer, increment one to the integer.

 The digits are stored such that the most significant digit is at the head of the list, and each element in the array contains a single digit.

 You may assume the integer does not contain any leading zero, except the number 0 itself.

 Example 1:

 Input: digits = [1,2,3]
 Output: [1,2,4]
 Explanation: The array represents the integer 123.
 Example 2:

 Input: digits = [4,3,2,1]
 Output: [4,3,2,2]
 Explanation: The array represents the integer 4321.
 Example 3:

 Input: digits = [0]
 Output: [1]
  
 Constraints:

 1 <= digits.length <= 100
 0 <= digits[i] <= 9
 
 */
func plusOne(_ digits: [Int]) -> [Int] {
    var digs = digits
    var carry = 1
    var i = digs.count - 1
    while carry > 0 && i >= 0 {
        let num = digs[i]
        var sum = num + carry
        carry = sum / 10
        sum = sum % 10
        digs[i] = sum
        i -= 1
    }
    if carry > 0 {
        digs.insert(carry, at: 0)
    }
    return digs
}

var digits = [9,9,9]
plusOne(digits)
