//
//  main.swift
//  ReorganizeString
//
//  Created by Behzad Dogahe on 6/18/21.
//

/*
 
 767. Reorganize String
 
 Given a string s, rearrange the characters of s so that any two adjacent characters are not the same.

 Return any possible rearrangement of s or return "" if not possible.

 Example 1:

 Input: s = "aab"
 Output: "aba"
 Example 2:

 Input: s = "aaab"
 Output: ""
  
 Constraints:

 1 <= s.length <= 500
 s consists of lowercase English letters.
 
 Also: https://www.geeksforgeeks.org/rearrange-characters-string-no-two-adjacent/
 
 */
import Foundation

public class MaxPQ<T: Comparable> {
    private var pq: [T]
    private var n: Int
    init(_ keys: [T]) {
        n = keys.count
        pq = keys
        for i in stride(from: Int(floor(Double(n)/2)) - 1, to: -1, by: -1) {
            maxHeapify(i)
        }
    }
    
    func maxHeapify(_ i: Int) {
        let l = 2 * i + 1
        let r = 2 * i + 2
        var largest: Int
        if l < n && pq[l] > pq[i] {
            largest = l
        } else {
            largest = i
        }
        if r < n && pq[r] > pq[largest] {
            largest = r
        }
        if largest != i {
            let temp = pq[largest]
            pq[largest] = pq[i]
            pq[i] = temp
            maxHeapify(largest)
        }
    }
    
    func max() -> T {
        return pq[0]
    }
    
    func extractMax() -> T {
        let max = pq[0]
        pq[0] = pq[n - 1]
        n = n - 1
        maxHeapify(0)
        return max
    }
    
    func insert(_ key: T) {
        n = n + 1
        pq.append(key) // dummy value just to increase the size of pq
        increaseKey(n - 1, key)
    }
    
    func increaseKey(_ i: Int, _ key: T) {
        var index = i
        pq[index] = key
        while index > 0 && pq[(index - 1)/2] < pq[index] {
            let temp = pq[(index - 1)/2]
            pq[(index - 1)/2] = pq[index]
            pq[index] = temp
            index = (index - 1)/2
        }
    }
    
    func queue() -> [T] {
        return Array(pq.prefix(n))
    }
    
    func size() -> Int {
        return n
    }
}

struct CharCount: Comparable, CustomStringConvertible {
    var description: String {
        "\(char): \(freq)"
    }
    
    static func < (lhs: CharCount, rhs: CharCount) -> Bool {
        lhs.freq < rhs.freq
    }
    
    let char: Character
    let freq: Int
}

// Using Priority Queue
func reorganizeString(_ s: String) -> String {
    var dict: [Character: Int] = [:]
    for i in 0 ..< s.count {
        let c = s[s.index(s.startIndex, offsetBy: i)]
        if let val = dict[c] {
            dict[c] = val + 1
        } else {
            dict[c] = 1
        }
    }
    var ccArr: [CharCount] = []
    for (_, (key, val)) in dict.enumerated() {
        let cc = CharCount(char: key, freq: val)
        ccArr.append(cc)
    }
    
    var output: String = ""
    let pq = MaxPQ(ccArr)
    var prev: CharCount = CharCount(char: "#", freq: -1)
    while pq.size() != 0 {
        let key = pq.extractMax()
        output.append(key.char)
        if prev.freq > 0 {
            pq.insert(prev)
        }
        prev = CharCount(char: key.char, freq: key.freq - 1)
    }
    
    if output.count == s.count {
        return output
    } else {
        return ""
    }
}

// Without Using Priority Queue
func reorganizeStringSimpler(_ s: String) -> String {
    var chars: [Int] = Array(repeating: 0, count: 26)
    var maxCount: Int = 0
    var maxCountChar: Character = "a"
    for i in 0 ..< s.count {
        let c = s[s.index(s.startIndex, offsetBy: i)]
        let index = Int(c.asciiValue! - Character("a").asciiValue!)
        chars[index] += 1
        if chars[index] > maxCount {
            maxCount = chars[index]
            maxCountChar = c
        }
    }
    
    if maxCount > (s.count + 1)/2 {
        return ""
    }
    
    var outputArr: [Character] = Array(repeating: " ", count: s.count)
    
    var i = 0
    var index = 0
    while i < maxCount {
        outputArr[index] = maxCountChar
        i += 1
        index += 2
    }
    
    chars[Int(maxCountChar.asciiValue! - Character("a").asciiValue!)] = 0
    
    for i in 0 ..< 26 {
        var repetition = chars[i]
        while repetition > 0 {
            index = index < s.count ? index : 1
            outputArr[index] = Character(UnicodeScalar(Character("a").asciiValue! + UInt8(i)))
            index += 2
            repetition -= 1
        }
    }
    return String(outputArr)
}

let r = reorganizeString("aaabc")
print(r)

let rr = reorganizeStringSimpler("aaabc")
print(rr)


// This part was just to test out the Priority Queue itself
/*
let b: [CharCount] = [CharCount(char: "a", freq: 15), CharCount(char: "b", freq: 13), CharCount(char: "c", freq: 9), CharCount(char: "d", freq: 5), CharCount(char: "e", freq: 12), CharCount(char: "f", freq: 8), CharCount(char: "g", freq: 7), CharCount(char: "h", freq: 4)]
print(b)
var maxPQ = MaxPQ(b)
print(maxPQ.queue())

print("max: \(maxPQ.extractMax())")
print(maxPQ.queue())

print("max: \(maxPQ.extractMax())")
print(maxPQ.queue())

print("max: \(maxPQ.extractMax())")
print(maxPQ.queue())

print("max: \(maxPQ.extractMax())")
print(maxPQ.queue())
*/

