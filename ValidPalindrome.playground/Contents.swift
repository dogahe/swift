// Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
// Note: For the purpose of this problem, we define empty string as valid palindrome.
// Example 1:
// Input: "A man, a plan, a canal: Panama"
// Output: true
// Example 2:
// Input: "race a car"
// Output: false

var s = "A man, a plan, a canal: Panama"

func isPalindrome(_ s: String) -> Bool {
    var i: Int = 0
    var j: Int = 1
    var isPalindrome: Bool = true
    while i + j <= s.count {
        let leftIndex = s.index(s.startIndex, offsetBy: i)
        let rightIndex = s.index(s.endIndex, offsetBy: -j)
        let left = s[leftIndex]
        let right = s[rightIndex]
        if !(left.isLetter || left.isNumber) {
            i += 1
            continue
        }
        if !(right.isLetter || right.isNumber) {
            j += 1
            continue
        }
        if left.lowercased() != right.lowercased() {
            isPalindrome = false
            break
        }
        i += 1
        j += 1
    }
    return isPalindrome
}

isPalindrome(s)
