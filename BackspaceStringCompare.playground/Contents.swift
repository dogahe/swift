/*
 
 tags:Google
 
 844. Backspace String Compare
 
 Given two strings s and t, return true if they are equal when both are typed into empty text editors. '#' means a backspace character.

 Note that after backspacing an empty text, the text will continue empty.

 Example 1:
 Input: s = "ab#c", t = "ad#c"
 Output: true
 Explanation: Both s and t become "ac".
 
 Example 2:
 Input: s = "ab##", t = "c#d#"
 Output: true
 Explanation: Both s and t become "".
 
 Example 3:
 Input: s = "a##c", t = "#a#c"
 Output: true
 Explanation: Both s and t become "c".
 
 Example 4:
 Input: s = "a#c", t = "b"
 Output: false
 Explanation: s becomes "c" while t becomes "b".
  
 Constraints:

 1 <= s.length, t.length <= 200
 s and t only contain lowercase letters and '#' characters.
  
 Follow up: Can you solve it in O(n) time and O(1) space?
 
 */

func backspaceCompare(_ s: String, _ t: String) -> Bool {
    let s1 = getBackspacedString(s)
    let t1 = getBackspacedString(t)
    return s1 == t1
}

func getBackspacedString(_ s: String) -> String {
    let sArr: [Character] = Array(s)
    var bsCount = 0
    var output: String = ""
    for i in 0 ..< sArr.count {
        let c = sArr[sArr.count - 1 - i]
        if c == "#" {
            bsCount += 1
        } else {
            if bsCount == 0 {
                output = "\(c)\(output)"
            } else {
                bsCount -= 1
            }
        }
    }
    return output
}

func backspaceCompareNoExtraSpace(_ s: String, _ t: String) -> Bool {
    let sArr: [Character] = Array(s)
    let tArr: [Character] = Array(t)
    var i = sArr.count - 1
    var j = tArr.count - 1
    var sSkip = 0
    var tSkip = 0
    while i >= 0 || j >= 0  {
        while i >= 0 {
            if sArr[i] == "#" {
                sSkip += 1
                i -= 1
            } else if sSkip > 0 {
                sSkip -= 1
                i -= 1
            } else {
                break
            }
        }
        while j >= 0 {
            if tArr[j] == "#" {
                tSkip += 1
                j -= 1
            } else if tSkip > 0 {
                tSkip -= 1
                j -= 1
            } else {
                break
            }
        }
        if i >= 0 && j >= 0 && sArr[i] != tArr[j] {
            return false
        }
        if (i >= 0) != (j >= 0) {
            return false
        }
        i -= 1
        j -= 1
    }
    return true
}

let s = "ab#c", t = "ad#c"
backspaceCompare(s, t)
backspaceCompareNoExtraSpace(s, t)

let s2 = "abc##", t2 = "c#d#"
backspaceCompare(s2, t2)
backspaceCompareNoExtraSpace(s2, t2)
