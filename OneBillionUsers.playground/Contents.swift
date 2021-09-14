/*
 
 tags:Facebook
 
 1 Billion Users
 We have N different apps with different user growth rates. At a given time t, measured in days, the number of users using an app is g^t (for simplicity we'll allow fractional users), where g is the growth rate for that app. These apps will all be launched at the same time and no user ever uses more than one of the apps. We want to know how many total users there are when you add together the number of users from each app.
 After how many full days will we have 1 billion total users across the N apps?
 Signature
 int getBillionUsersDay(float[] growthRates)
 Input
 1.0 < growthRate < 2.0 for all growth rates
 1 <= N <= 1,000
 Output
 Return the number of full days it will take before we have a total of 1 billion users across all N apps.
 Example 1
 growthRates = [1.5]
 output = 52
 Example 2
 growthRates = [1.1, 1.2, 1.3]
 output = 79
 Example 3
 growthRates = [1.01, 1.02]
 output = 1047
 
 
 */

import Foundation
// Add any extra import statements you may need here


// Add any helper functions you may need here


struct GrowthRates {
  let rates: [Double]
}

private extension GrowthRates {
  func daysUntilBillionUsers() -> Int {
    var days = 1
    var users = rates
    while users.reduce(0, +) < 1_000_000_000 {
        for i in 0 ..< users.count {
            users[i] *= rates[i]
        }
        days += 1
    }
    return days
  }
}

// These are the tests we use to determine if the solution is correct.
// You can add your own at the bottom.

var testCaseNumber = 1

private func check(_ expectedValue: Int, matches output: Int) {
  let rightTick = "\u{2713}"
  let wrongTick = "\u{2717}"
    
  let result = expectedValue == output
  if result {
    print("\(rightTick) Test #\(testCaseNumber)")
  } else {
    print("\(wrongTick) Test #\(testCaseNumber) Expected: \(expectedValue) Your output: \(output)")
  }
  testCaseNumber += 1
}

let rates1 = GrowthRates(rates: [1.1, 1.2, 1.3])
check(79, matches: rates1.daysUntilBillionUsers())

let rates2 = GrowthRates(rates: [1.01, 1.02])
check(1047, matches: rates2.daysUntilBillionUsers())

// Add your own test cases here
