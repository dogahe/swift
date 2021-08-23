//
//  main.swift
//  NextClosestTime
//
//  Created by Behzad Dogahe on 8/4/21.
//

/*
 
 tags:Google
 
 681. Next Closest Time
 
 Given a time represented in the format "HH:MM", form the next closest time by reusing the current digits. There is no limit on how many times a digit can be reused.

 You may assume the given input string is always valid. For example, "01:34", "12:09" are all valid. "1:34", "12:9" are all invalid.

 Example 1:

 Input: time = "19:34"
 Output: "19:39"
 Explanation: The next closest time choosing from digits 1, 9, 3, 4, is 19:39, which occurs 5 minutes later.
 It is not 19:33, because this occurs 23 hours and 59 minutes later.
 Example 2:

 Input: time = "23:59"
 Output: "22:22"
 Explanation: The next closest time choosing from digits 2, 3, 5, 9, is 22:22.
 It may be assumed that the returned time is next day's time since it is smaller than the input time numerically.
  
 Constraints:

 time.length == 5
 time is a valid time in the form "HH:MM".
 0 <= HH < 24
 0 <= MM < 60

 */

func nextClosestTime(_ time: String) -> String {
    let splits = time.split(separator: ":")
    let hh: [Character] = Array(splits[0])
    let mm: [Character] = Array(splits[1])
    var digits: [Int] = []
    digits.append(contentsOf: hh.map( { $0.wholeNumberValue! } ))
    digits.append(contentsOf: mm.map( { $0.wholeNumberValue! } ))
    digits = Array(Set(digits)).sorted()
    
    var timeArr: [Character] = Array(time)
    for i in 0 ..< timeArr.count {
        let index = timeArr.count - 1 - i
        let c = timeArr[index]
        if i != 2 {
            let cNum = c.wholeNumberValue!
            let selectedDigit = digits.min()!
            if i == 0 {
                for digit in digits {
                    if digit > cNum {
                        timeArr[index] = Character("\(digit)")
                        return String(timeArr)
                    }
                }
            } else if i == 1 {
                for digit in digits {
                    if digit > cNum && digit < 6 {
                        timeArr[index] = Character("\(digit)")
                        return String(timeArr)
                    }
                }
            } else if i == 3 {
                for digit in digits {
                    if digit > cNum && Int("\(timeArr[0])\(digit)")! < 24 {
                        timeArr[index] = Character("\(digit)")
                        return String(timeArr)
                    }
                }
            } else if i == 4 {
                for digit in digits {
                    if digit > cNum && Int("\(digit)\(timeArr[1])")! < 24 {
                        timeArr[index] = Character("\(digit)")
                        return String(timeArr)
                    }
                }
            }
            timeArr[index] = Character("\(selectedDigit)")
        }
    }
    return String(timeArr)
}

let time = "19:34"
print(nextClosestTime(time))

let time2 = "22:59"
print(nextClosestTime(time2))

let time3 = "13:55"
print(nextClosestTime(time3))

