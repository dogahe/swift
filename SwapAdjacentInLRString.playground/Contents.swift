/*
 
 tags:Google
 
 777. Swap Adjacent in LR String
 
 In a string composed of 'L', 'R', and 'X' characters, like "RXXLRXRXL", a move consists of either replacing one occurrence of "XL" with "LX", or replacing one occurrence of "RX" with "XR". Given the starting string start and the ending string end, return True if and only if there exists a sequence of moves to transform one string to the other.

 Example 1:
 Input: start = "RXXLRXRXL", end = "XRLXXRRLX"
 Output: true
 Explanation: We can transform start to end following these steps:
 RXXLRXRXL ->
 XRXLRXRXL ->
 XRLXRXRXL ->
 XRLXXRRXL ->
 XRLXXRRLX
 
 Example 2:
 Input: start = "X", end = "L"
 Output: false
 
 Example 3:
 Input: start = "LLR", end = "RRL"
 Output: false
 
 Example 4:
 Input: start = "XL", end = "LX"
 Output: true
 
 Example 5:
 Input: start = "XLLR", end = "LXLX"
 Output: false
  
 Constraints:

 1 <= start.length <= 104
 start.length == end.length
 Both start and end will only consist of characters in 'L', 'R', and 'X'.
 
 */
func canTransform(_ start: String, _ end: String) -> Bool {
    if start.count != end.count {
        return false
    }
    var lrStart: [(Character, Int)] = []
    var lrEnd: [(Character, Int)] = []
    let startArr: [Character] = Array(start)
    let endArr: [Character] = Array(end)
    for i in 0 ..< start.count {
        if startArr[i] == "R" || startArr[i] == "L" {
            lrStart.append((startArr[i], i))
        }
        if endArr[i] == "R" || endArr[i] == "L" {
            lrEnd.append((endArr[i], i))
        }
    }
    if lrStart.count != lrEnd.count {
        return false
    }
    for i in 0 ..< lrStart.count {
        if lrStart[i].0 != lrEnd[i].0 {
            return false
        }
        if lrStart[i].0 == "R" {
            if lrStart[i].1 > lrEnd[i].1 {
                return false
            }
        }
        if lrStart[i].0 == "L" {
            if lrStart[i].1 < lrEnd[i].1 {
                return false
            }
        }
    }
    return true
}


let start = "RXXLRXRXL", end = "XRLXXRRLX"
canTransform(start, end)

let start2 = "X", end2 = "L"
canTransform(start2, end2)

let start3 = "LLR", end3 = "RRL"
canTransform(start3, end3)

let start4 = "XL", end4 = "LX"
canTransform(start4, end4)

let start5 = "XLLR", end5 = "LXLX"
canTransform(start5, end5)


