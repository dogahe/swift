/*
 
 846. Hand of Straights
 
 Alice has a hand of cards, given as an array of integers.

 Now she wants to rearrange the cards into groups so that each group is size groupSize, and consists of groupSize consecutive cards.

 Return true if and only if she can.

 Note: This question is the same as 1296: https://leetcode.com/problems/divide-array-in-sets-of-k-consecutive-numbers/

 Example 1:
 Input: hand = [1,2,3,6,2,3,4,7,8], groupSize = 3
 Output: true
 Explanation: Alice's hand can be rearranged as [1,2,3],[2,3,4],[6,7,8]
 
 Example 2:
 Input: hand = [1,2,3,4,5], groupSize = 4
 Output: false
 Explanation: Alice's hand can't be rearranged into groups of 4.

 Constraints:

 1 <= hand.length <= 10000
 0 <= hand[i] <= 109
 1 <= groupSize <= hand.length
 
 */
func isNStraightHand(_ hand: [Int], _ groupSize: Int) -> Bool {
    var sortedHand = hand.sorted()
    var arr: [Int] = []
    var index: Int = 0
    while index < sortedHand.count {
        if arr.count < groupSize {
            let num = sortedHand[index]
            if arr.isEmpty || num == arr.last! + 1 {
                arr.append(sortedHand.remove(at: index))
            } else {
                index += 1
            }
        } else {
            arr = []
            index = 0
        }
    }
    return sortedHand.isEmpty && arr.count == groupSize
}


let hand1 = [1,2,3,6,2,3,4,7,8]
let groupSize1 = 3
isNStraightHand(hand1, groupSize1)
print("=======")
let hand2 = [1,2,3,4,5]
let groupSize2 = 4
isNStraightHand(hand2, groupSize2)
