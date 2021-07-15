/*
 
 299. Bulls and Cows
 
 You are playing the Bulls and Cows game with your friend.

 You write down a secret number and ask your friend to guess what the number is. When your friend makes a guess, you provide a hint with the following info:

 The number of "bulls", which are digits in the guess that are in the correct position.
 The number of "cows", which are digits in the guess that are in your secret number but are located in the wrong position. Specifically, the non-bull digits in the guess that could be rearranged such that they become bulls.
 Given the secret number secret and your friend's guess guess, return the hint for your friend's guess.

 The hint should be formatted as "xAyB", where x is the number of bulls and y is the number of cows. Note that both secret and guess may contain duplicate digits.

 Example 1:

 Input: secret = "1807", guess = "7810"
 Output: "1A3B"
 Explanation: Bulls are connected with a '|' and cows are underlined:
 "1807"
   |
 "7810"
 Example 2:

 Input: secret = "1123", guess = "0111"
 Output: "1A1B"
 Explanation: Bulls are connected with a '|' and cows are underlined:
 "1123"        "1123"
   |      or     |
 "0111"        "0111"
 Note that only one of the two unmatched 1s is counted as a cow since the non-bull digits can only be rearranged to allow one 1 to be a bull.
 Example 3:

 Input: secret = "1", guess = "0"
 Output: "0A0B"
 Example 4:

 Input: secret = "1", guess = "1"
 Output: "1A0B"
  

 Constraints:

 1 <= secret.length, guess.length <= 1000
 secret.length == guess.length
 secret and guess consist of digits only.
 
 */

func getHintFaster(_ secret: String, _ guess: String) -> String {
    var cows = 0
    var bulls = 0
    var numbers: [Int] = Array(repeating: 0, count: 10)
    for i in 0 ..< secret.count {
        let s = secret[secret.index(secret.startIndex, offsetBy: i)]
        let g = guess[guess.index(guess.startIndex, offsetBy: i)]
        if s == g {
            bulls += 1
        } else {
            let si = Int(s.asciiValue! - Character("0").asciiValue!)
            let gi = Int(g.asciiValue! - Character("0").asciiValue!)
            if numbers[si] < 0 {
                cows += 1
            }
            if numbers[gi] > 0 {
                cows += 1
            }
            numbers[si] += 1
            numbers[gi] -= 1
        }
    }
    return "\(bulls)A\(cows)B"
}

func getHint(_ secret: String, _ guess: String) -> String {
    var secretDict: [Character: [Int]] = [:]
    for i in 0 ..< secret.count {
        let c = secret[secret.index(secret.startIndex, offsetBy: i)]
        if var val = secretDict[c] {
            val.append(i)
            secretDict[c] = val
        } else {
            secretDict[c] = [i]
        }
    }
    
    var guessDict: [Character: [Int]] = [:]
    for i in 0 ..< guess.count {
        let c = guess[guess.index(guess.startIndex, offsetBy: i)]
        if var val = guessDict[c] {
            val.append(i)
            guessDict[c] = val
        } else {
            guessDict[c] = [i]
        }
    }
    
    var cows = 0
    var bulls = 0
    for i in 0 ... 9 {
        let c = Character(UnicodeScalar(Character("0").asciiValue! + UInt8(i)))
        if let sVal = secretDict[c], let gVal = guessDict[c] {
            let bc = getCowsBulls(sVal, gVal)
            cows += bc.1
            bulls += bc.0
        }
    }
    return "\(bulls)A\(cows)B"
}

func getCowsBulls(_ arr1: [Int], _ arr2: [Int]) -> (Int, Int) {
    var bulls = 0
    var dict1: [Int: Bool] = [:]
    for i in arr1 {
        dict1[i] = true
    }
    for i in arr2 {
        if let val = dict1[i], val {
            bulls += 1
        }
    }
    let cows = min(arr1.count - bulls, arr2.count - bulls)
    return (bulls, cows)
}


let secret = "1807"
let guess = "7810"
getHint(secret, guess)
getHintFaster(secret, guess)

let secret2 = "1123"
let guess2 = "0111"
getHint(secret2, guess2)
getHintFaster(secret2, guess2)

let secret3 = "1"
let guess3 = "1"
getHint(secret3, guess3)
getHintFaster(secret3, guess3)
