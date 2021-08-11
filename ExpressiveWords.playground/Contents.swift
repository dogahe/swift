/*
 
 tags:Google
 
 809. Expressive Words
 
 Sometimes people repeat letters to represent extra feeling, such as "hello" -> "heeellooo", "hi" -> "hiiii".  In these strings like "heeellooo", we have groups of adjacent letters that are all the same:  "h", "eee", "ll", "ooo".
 
 For some given string s, a query word is stretchy if it can be made to be equal to s by any number of applications of the following extension operation: choose a group consisting of characters c, and add some number of characters c to the group so that the size of the group is 3 or more.
 
 For example, starting with "hello", we could do an extension on the group "o" to get "hellooo", but we cannot get "helloo" since the group "oo" has size less than 3.  Also, we could do another extension like "ll" -> "lllll" to get "helllllooo".  If s = "helllllooo", then the query word "hello" would be stretchy because of these two extension operations: query = "hello" -> "hellooo" -> "helllllooo" = s.
 
 Given a list of query words, return the number of words that are stretchy.
 
 Example:
 Input:
 s = "heeellooo"
 words = ["hello", "hi", "helo"]
 Output: 1
 Explanation:
 We can extend "e" and "o" in the word "hello" to get "heeellooo".
 We can't extend "helo" to get "heeellooo" because the group "ll" is not size 3 or more.
 
 Constraints:
 0 <= len(s) <= 100.
 0 <= len(words) <= 100.
 0 <= len(words[i]) <= 100.
 s and all words in words consist only of lowercase letters
 
 */
func expressiveWords(_ s: String, _ words: [String]) -> Int {
    var last: Character = "-"
    var sArr: [(Character, Int)] = []
    for char in s {
        if char == last {
            sArr[sArr.count - 1] = (char, sArr[sArr.count - 1].1 + 1)
        } else {
            sArr.append((char, 1))
            last = char
        }
    }
    var sum = 0
    for word in words {
        last = "-"
        var wArr: [(Character, Int)] = []
        for char in word {
            if char == last {
                wArr[wArr.count - 1] = (char, wArr[wArr.count - 1].1 + 1)
            } else {
                wArr.append((char, 1))
                last = char
            }
        }
        if isStretchy(sArr, wArr) {
            sum += 1
        }
    }
    return sum
}

func isStretchy(_ a: [(Character, Int)], _ b: [(Character, Int)]) -> Bool {
    if a.count != b.count {
        return false
    }
    for i in 0 ..< a.count {
        if a[i].0 != b[i].0 {
            return false
        }
        if a[i].1 != b[i].1 {
            if a[i].1 < 3 {
                return false
            }
            if a[i].1 < b[i].1 {
                return false
            }
        }
    }
    return true
}

let s = "heeellooo"
let words = ["hello", "hi", "helo"]
let sum = expressiveWords(s, words)
print(sum)

let s2 = "sass"
let words2 = ["sa"]

let sum2 = expressiveWords(s2, words2)
print(sum2)

