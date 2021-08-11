/*
 
 tags:Google
 
 849. Maximize Distance to Closest Person
 
 You are given an array representing a row of seats where seats[i] = 1 represents a person sitting in the ith seat, and seats[i] = 0 represents that the ith seat is empty (0-indexed).

 There is at least one empty seat, and at least one person sitting.

 Alex wants to sit in the seat such that the distance between him and the closest person to him is maximized.

 Return that maximum distance to the closest person.

 Example 1:
 Input: seats = [1,0,0,0,1,0,1]
 Output: 2
 Explanation:
 If Alex sits in the second open seat (i.e. seats[2]), then the closest person has distance 2.
 If Alex sits in any other open seat, the closest person has distance 1.
 Thus, the maximum distance to the closest person is 2.
 
 Example 2:
 Input: seats = [1,0,0,0]
 Output: 3
 Explanation:
 If Alex sits in the last seat (i.e. seats[3]), the closest person is 3 seats away.
 This is the maximum distance possible, so the answer is 3.
 
 Example 3:
 Input: seats = [0,1]
 Output: 1
  
 Constraints:
 2 <= seats.length <= 2 * 104
 seats[i] is 0 or 1.
 At least one seat is empty.
 At least one seat is occupied.
 */

func maxDistToClosest(_ seats: [Int]) -> Int {
    var l = 0
    var r = 0
    var maxDistance = 0
    while r < seats.count {
        if seats[r] == 1 {
            r += 1
            l = r
            continue
        }
        if l == 0 || r == seats.count - 1 {
            maxDistance = max(maxDistance, r - l + 1)
        } else {
            maxDistance = max(maxDistance, (r - l)/2 + 1)
        }
        r += 1
    }
    return maxDistance
}

let seats = [1,0,0,0,1,0,1]
maxDistToClosest(seats)

let seats2 = [1,0,0,0]
maxDistToClosest(seats2)

let seats3 = [0,1]
maxDistToClosest(seats3)

let seats4 = [1,0,0,1,0,0,0,1,1,1,0,0,0,0,0,0,1,0,0,0,0,0]
maxDistToClosest(seats4)
