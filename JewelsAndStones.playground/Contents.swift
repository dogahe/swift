/*
 
 tags:Google
 
 771. Jewels and Stones
 
 You're given strings jewels representing the types of stones that are jewels, and stones representing the stones you have. Each character in stones is a type of stone you have. You want to know how many of the stones you have are also jewels.

 Letters are case sensitive, so "a" is considered a different type of stone from "A".

 Example 1:
 Input: jewels = "aA", stones = "aAAbbbb"
 Output: 3
 
 Example 2:
 Input: jewels = "z", stones = "ZZ"
 Output: 0
  
 Constraints:

 1 <= jewels.length, stones.length <= 50
 jewels and stones consist of only English letters.
 All the characters of jewels are unique.
 
 */

func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
    var dict: [Character: Bool] = [:]
    let jewelsArr: [Character] = Array(jewels)
    for i in 0 ..< jewels.count {
        dict[jewelsArr[i]] = true
    }
    let stonesArr: [Character] = Array(stones)
    var sum = 0
    for i in 0 ..< stones.count {
        if dict[stonesArr[i]] != nil {
            sum += 1
        }
    }
    return sum
}

let jewels = "aA", stones = "aAAbbbb"
numJewelsInStones(jewels, stones)

let jewels2 = "z", stones2 = "ZZ"
numJewelsInStones(jewels2, stones2)
