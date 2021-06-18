import Foundation
import XCTest


/*
 1) A method that takes an input of List of Strings and returns a list of unique strings
 Input: "Is it Sunny", " Sunny it is", "Hello World", "hello World", "HelloW orld"
 Output: " Sunny it is", "hello World","HelloW orld"
 
 Rules:
 a) two strings are considered the same if the only difference between the two is the uppercase and lowercase characters.
 b) Two strings are considered the same as long as they have the same words in them. In the above example " Is it Sunny" and " Sunny it is" are considered the same.
 c) return the last seen string if multiple strings are the same. In the above example "Hello World", "Hello world", "hello world" return "hello world"
 
 extra points: d) The input order needs to be maintained in the output order.
 */


// -------------------------------------
// IMPLEMENT ME
// -------------------------------------

// Using a Dictionary of String:Int
func getUniqueStrings(_ strings: [String]) -> [String] {
    var dict: [String: Int] = [:]
    for str in strings {
        let key = getKey(str)
        if let val = dict[key] {
            dict[key] = val + 1
        } else {
            dict[key] = 1
        }
    }
    
    var output: [String] = []
    for i in 0 ..< strings.count {
        let str = strings[strings.count - 1 - i]
        let key = getKey(str)
        if let val = dict[key] {
            if val > 0 {
                output.insert(str, at: 0)
                dict[key] = 0
            }
        }
    }
    return output
}

// N : string
// M : word in string.   N * (M Log M)

func getKey(_ str: String) -> String {
    let lower = str.lowercased()
    let words = lower.split(separator: " ").map( { String($0) } )
    let nonEmpty = words.filter( { !$0.isEmpty } )
    let sorted = nonEmpty.sorted()
    let key = sorted.joined(separator: ".")
    return key
}

let strs = ["Is it Sunny", " Sunny it is", "Hello World", "hello World", "HelloW orld"]
print(getUniqueStrings(strs))


/*
 /////////////////////
 Test Logic
 /////////////////////
 */

class MySolution: XCTestCase {
    
    static var allTests = {
        return [("testSolution", testSolution)]
    }()
    
    func testSolution() {
        let input: [String] = [
            " Is it Sunny",
            " Sunny it is",
            "Hello World",
            "hello World",
            "HelloW orld"
        ]
        
        let output: [String] = [
            " Sunny it is",
            "hello World",
            "HelloW orld"
        ]
        
        XCTAssertEqual(getUniqueStrings(input), output)
    }
}

// XCTMain([testCase(MySolution.allTests)])
