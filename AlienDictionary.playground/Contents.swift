/*

 269. Alien Dictionary


 There is a new alien language which uses the latin alphabet. However, the order among letters are unknown to you. You receive a list of non-empty words from the dictionary, where words are sorted lexicographically by the rules of this new language. Derive the order of letters in this language.

 Example 1:
 Input:
[
 "wrt",
 "wrf",
 "er",
 "ett",
 "rftt"
]

 Output: "wertf"

 Example 2:

 Example 2:

 Input:
 [
 "z"
 "x"
 ]

 Output: "zx"

 Example 3:

 Input:
[
 "z",
 "x",
 "z"
]
 
 Explanation: The order is invalid, so return "".

 Note:
 1. You may assume all letters are in lowercase.
 2. You may assume that if a is a prefix of b, then a must appear before b in the given dictionary.
 */

func alienOrder(_ words: [String]) -> String {
    let wordArrays: [[Character]] = words.map( { Array($0) } )
    var orderedChars: [Character] = []
    helper(wordArrays, &orderedChars)
    return String(orderedChars)
}

func helper(_ wordArrays: [[Character]], _ orderedChars: inout [Character]) {
    let firstLetters = wordArrays.compactMap( { $0.first! } )
    var uniqueFirstLetters: [Character] = []
    uniqueFirstLetters.append(firstLetters[0])
    for i in 1 ..< firstLetters.count {
        let a = firstLetters[i - 1]
        let b = firstLetters[i]
        if b != a {
            uniqueFirstLetters.append(b)
        }
    }
    orderedChars = merge(uniqueFirstLetters, orderedChars)
    
}

func merge(_ array1: [Character], _ array2: [Character]) -> [Character] {
    
}


let input: [String] = [
    "wrt",
    "wrf",
    "er",
    "ett",
    "rftt"
]
