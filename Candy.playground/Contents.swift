/*
 tags:Google
 
 135. Candy
 
 There are n children standing in a line. Each child is assigned a rating value given in the integer array ratings.

 You are giving candies to these children subjected to the following requirements:

 Each child must have at least one candy.
 Children with a higher rating get more candies than their neighbors.
 Return the minimum number of candies you need to have to distribute the candies to the children.

 Example 1:
 Input: ratings = [1,0,2]
 Output: 5
 Explanation: You can allocate to the first, second and third child with 2, 1, 2 candies respectively.
 
 Example 2:
 Input: ratings = [1,2,2]
 Output: 4
 Explanation: You can allocate to the first, second and third child with 1, 2, 1 candies respectively.
 The third child gets 1 candy because it satisfies the above two conditions.
  
 Constraints:

 n == ratings.length
 1 <= n <= 2 * 104
 0 <= ratings[i] <= 2 * 104
 */
func candy(_ ratings: [Int]) -> Int {
    var candies: [Int] = Array(repeating: 1, count: ratings.count)
    var hasChanged: Bool = true
    while hasChanged {
        hasChanged = false
        for i in 0 ..< ratings.count {
            if i > 0 && ratings[i] > ratings[i - 1] && candies[i] <= candies[i - 1] {
                candies[i] = candies[i - 1] + 1
                hasChanged = true
            }
            if i < ratings.count - 1 && ratings[i] > ratings[i + 1] && candies[i] <= candies[i + 1] {
                candies[i] = candies[i + 1] + 1
                hasChanged = true
            }
        }
    }
    return candies.reduce(0, +)
}

func candy2(_ ratings: [Int]) -> Int {
    var left2right: [Int] = Array(repeating: 1, count: ratings.count)
    var right2left: [Int] = Array(repeating: 1, count: ratings.count)
    for i in 0 ..< ratings.count {
        if i > 0 && ratings[i] > ratings[i - 1] && left2right[i] <= left2right[i - 1] {
            left2right[i] = left2right[i - 1] + 1
        }
    }
    for i in 0 ..< ratings.count {
        if i > 0 && ratings[ratings.count - 1 - i] > ratings[ratings.count - 1 - i + 1] && right2left[ratings.count - 1 - i] <= right2left[ratings.count - 1 - i + 1] {
            right2left[ratings.count - 1 - i] = right2left[ratings.count - 1 - i + 1] + 1
        }
    }
    var sum = 0
    for i in 0 ..< ratings.count {
        sum += max(left2right[i], right2left[i])
    }
    return sum
}

var ratings = [1,0,2]
candy(ratings)
candy2(ratings)

var ratings2 = [1,2,2]
candy(ratings2)
candy2(ratings2)

var ratings3 = [1,2,1,0]
candy(ratings3)
candy2(ratings3)

