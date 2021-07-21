/*
 
 1423. Maximum Points You Can Obtain from Cards
 
 There are several cards arranged in a row, and each card has an associated number of points. The points are given in the integer array cardPoints.

 In one step, you can take one card from the beginning or from the end of the row. You have to take exactly k cards.

 Your score is the sum of the points of the cards you have taken.

 Given the integer array cardPoints and the integer k, return the maximum score you can obtain.

 Example 1:
 Input: cardPoints = [1,2,3,4,5,6,1], k = 3
 Output: 12
 Explanation: After the first step, your score will always be 1. However, choosing the rightmost card first will maximize your total score. The optimal strategy is to take the three cards on the right, giving a final score of 1 + 6 + 5 = 12.

 Example 2:
 Input: cardPoints = [2,2,2], k = 2
 Output: 4
 Explanation: Regardless of which two cards you take, your score will always be 4.
 
 Example 3:
 Input: cardPoints = [9,7,7,9,7,7,9], k = 7
 Output: 55
 Explanation: You have to take all the cards. Your score is the sum of points of all cards.
 
 Example 4:
 Input: cardPoints = [1,1000,1], k = 1
 Output: 1
 Explanation: You cannot take the card in the middle. Your best score is 1.
 
 Example 5:
 Input: cardPoints = [1,79,80,1,1,1,200,1], k = 3
 Output: 202

 Constraints:
 
 1 <= cardPoints.length <= 105
 1 <= cardPoints[i] <= 104
 1 <= k <= cardPoints.length
 */

func maxScore(_ cardPoints: [Int], _ k: Int) -> Int {
    var preSum: [Int] = [0]
    var postSum: [Int] = [0]
    var sum = 0
    for i in 0 ..< cardPoints.count {
        sum += cardPoints[i]
        preSum.append(sum)
    }
    sum = 0
    for i in 0 ..< cardPoints.count {
        sum += cardPoints[cardPoints.count - 1 - i]
        postSum.append(sum)
    }
    var maxScore: Int = 0
    for i in 0 ... k {
        let score = preSum[i] + postSum[k - i]
        maxScore = max(maxScore, score)
    }
    return maxScore
}

// Slow
/*
 
func maxScore(_ cardPoints: [Int], _ k: Int) -> Int {
    var results: [[Int]] = Array(repeating: Array(repeating: -1, count: cardPoints.count), count: cardPoints.count)
    return helper(0, cardPoints.count - 1, cardPoints, k, &results)
}

func helper(_ left: Int, _ right: Int, _ cardPoints: [Int], _ k: Int, _ results: inout [[Int]]) -> Int {
    print(left, right, k)
    if results[left][right] != -1 {
        return results[left][right]
    }
    var result: Int
    if k == 1 {
        result = max(cardPoints[left], cardPoints[right])
    } else {
        result = max(helper(left + 1, right, cardPoints, k - 1, &results) + cardPoints[left]
                     , helper(left, right - 1, cardPoints, k - 1, &results) + cardPoints[right])
    }
    results[left][right] = result
    return result
}
*/

let cardPoints = [1,2,3,4,5,6,1], k = 3
maxScore(cardPoints, k)

print("===============")

let cardPoints2 = [2,2,2], k2 = 2
maxScore(cardPoints2, k2)

print("===============")

let cardPoints3 = [9,7,7,9,7,7,9], k3 = 7
maxScore(cardPoints3, k3)

print("===============")

let cardPoints4 = [1,1000,1], k4 = 1
maxScore(cardPoints4, k4)

print("===============")

let cardPoints5 = [1,79,80,1,1,1,200,1], k5 = 3
maxScore(cardPoints5, k5)
