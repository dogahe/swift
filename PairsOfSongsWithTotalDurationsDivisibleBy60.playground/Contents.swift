/*
 Pairs of Songs With Total Durations Divisible by 60
 
 You are given a list of songs where the ith song has a duration of time[i] seconds.

 Return the number of pairs of songs for which their total duration in seconds is divisible by 60. Formally, we want the number of indices i, j such that i < j with (time[i] + time[j]) % 60 == 0.

  

 Example 1:

 Input: time = [30,20,150,100,40]
 Output: 3
 Explanation: Three pairs have a total duration divisible by 60:
 (time[0] = 30, time[2] = 150): total duration 180
 (time[1] = 20, time[3] = 100): total duration 120
 (time[1] = 20, time[4] = 40): total duration 60
 Example 2:

 Input: time = [60,60,60]
 Output: 3
 Explanation: All three pairs have a total duration of 120, which is divisible by 60.
  

 Constraints:

 1 <= time.length <= 6 * 104
 1 <= time[i] <= 500
 
 Hide Hint #1
We only need to consider each song length modulo 60.
 
 Hide Hint #2
We can count the number of songs with (length % 60) equal to r, and store that in an array of size 60.
 */

import Foundation

func numPairsDivisibleBy60(_ time: [Int]) -> Int {
    var sum: Int = 0
    for i in 0 ..< time.count {
        let t1 = time[i]
        for j in i+1 ..< time.count {
            let t2 = time[j]
            if (t1 + t2) % 60 == 0 {
                sum += 1
            }
        }
    }
    return sum
}

func numPairsDivisibleBy60Map(_ time: [Int]) -> Int {
    var rem: [Int] = Array(repeating: 0, count: 60)
    for i in 0 ..< time.count {
        let r = time[i] % 60
        rem[r] += 1
    }
    var sum: Int = 0
    for i in 0 ... 30 {
        let n1 = rem[i]
        if i == 0 || i == 30 {
            sum += n1 * (n1 - 1) / 2
        } else {
            let n2 = rem[60 - i]
            sum += n1 * n2
        }
    }
    return sum
}

let time = [60,60,60]//[30,20,150,100,40]

numPairsDivisibleBy60Map(time)
