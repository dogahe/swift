import Foundation

func largestMerge(_ word1: String, _ word2: String) -> String {
    var i = 0
    var j = 0
    var output: String = ""
    while i < word1.count && j < word2.count {
        let c1 = word1[word1.index(word1.startIndex, offsetBy: i)]
        let c2 = word2[word2.index(word2.startIndex, offsetBy: j)]
        if c1 < c2 {
            output.append(c2)
            j += 1
        } else if c2 < c1 {
            output.append(c1)
            i += 1
        } else {
            var ii = i
            var jj = j
            var cc1 = c1
            var cc2 = c2
            while cc1 == cc2 && ii < word1.count && jj < word2.count {
                cc1 = word1[word1.index(word1.startIndex, offsetBy: ii)]
                cc2 = word2[word2.index(word2.startIndex, offsetBy: jj)]
                ii += 1
                jj += 1
            }
            if cc1 != cc2 {
                if cc1 > cc2 {
                    output.append(c1)
                    i += 1
                } else {
                    output.append(c2)
                    j += 1
                }
            } else {
                if ii == word1.count {
                    output.append(c2)
                    j += 1
                } else if jj == word2.count {
                    output.append(c1)
                    i += 1
                }
            }
            
        }
    }
    if i < word1.count {
        output.append(String(word1.suffix(word1.count - i)))
    }
    if j < word2.count {
        output.append(String(word2.suffix(word2.count - j)))
    }
    
    /*
    while i < word1.count {
        let c1 = word1[word1.index(word1.startIndex, offsetBy: i)]
        output.append(c1)
        i += 1
    }
    while j < word2.count {
        let c2 = word2[word2.index(word2.startIndex, offsetBy: j)]
        output.append(c2)
        j += 1
    }
 */
    return output
}


// let word1 = "cabaa"
// let word2 = "bcaaa"

// let word1 = "abcabc"
// let word2 = "abdcaba"

//let word1 = "guguuuuuuuuuuuuuuguguuuuguug"
//let word2 = "gguggggggguuggguugggggg"

let word1 = "oooooooooooooooooooooooovoooooooovoooooooovoooovooooooooooooooovooooooooovoooooooovvooooooooooooooovooooooooooooovoovoovooooovoovoooooooooooooooooooooooooovooooovvoooooooooooooooooooooovoooooooooooooooovoooovvoooooooooooooooooooovooovooooooovooooooovoooooovvoooovvoooooovoooovooooooooooooooooooooovovoooooooooooooooooooovooooooooooooooooooooooooooooooooooooovoooooooooooooooooooooooooooooooooovooooooooooooovooooooooooooovoooooovoooooooooooooooovoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooovooooovooooooovooooooooooooooooovoooooooooooooooooooooooovooovoooooooooooooooooooovvvoooooooooovooooooooooooooooooooooooovovoooooooooovvvvoovoooooooooooovooooooooooooooovvoooooovoovvoooooooooooooooooooooooooovoooovoovoooooooooooovooooooooovvoooooooooooooooooovoooooooovooooovooooooovooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooovoooooooooooooooooooooooooooovooooooovovoooooooooooooooooooooooooooooooooooooooooovooooooovooooooovoooooooooooooovovoooooovooooovoooooooooooovvoovovvoooooooooooooooovoovovoooovoooooovoovooovoooooooooooovovoooovoooooooooooooooooovooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooovovoooooooooooooooooovooooooooooooovoovvoovooooooooooooovooooovvooooovoooovoooovooooooooooooooooooooooooooooooooooooooovooooooooooooooovooooooovooooooooooooooooooooooooooooooooovooooooooooooooooooovooovvooooooooooooooooooooooovooooooooooooovoovoooooooooooooooooovoooooooooovoooooooooooooooooooooooooovooovooooovooooooooooooooooooovooovvooooooooooooooooooooooooovovooooovoooooooooovvoooooovvooooooooooooooooooooooooooooooooooooooooooooooovoooovvooooovovooooooooooooooovooooooooovoooovooooooooovovoooovoooooooovvoooooooooovoooovoooooovooooovoooooooooooooovooovovooooooooooooooooovoooooooooooooooooovooooovooovooovooooooooooovoooooovooooovoooovovooovoooooovvoooooooooooooooooooovovoooooooooooooooooovoooooooovooo"
let word2 = "oooovovooovooooooooovooooooovooooooovoovoovoooooovooooooooovoooooooooooooovovoooooooooooooooooovoooooovoooooooooooooooovooovoovoovvooooooooooooooooooooovovovoovoooooooovoooooooooooooooooooooooooooovoooovovoooooooooovooooooooooooooooovooooovoooooooovoovoooooovooooooooooooovovoooooooovoooooooooooooooovooooooooooooovooooooooooooovoooooovoooooovovoovoooooovovoovoovooooovooooooooooooooooovoovvvoooooooooovoooooooooooooooooooooooooooovooovooooovooooooovoooooovoooooooooooooovvoovooooooovooooooooooovooooooovovooooovooooooooooooooooovvvooooooooooooovovoovooovooooooooooooovooooovoovovoooooooooooovoovvvooooovoovoooooooovoovoooooooooovvoooooovoooooooooooooooooovoovooooooooovoooooovoovovoovoovovoovoovoooooooooovoooooovoooooooooooooooovoooovoooooooovoooovoooovoovooooovvooooovooovvoooooooooooovooooooooooooooooovooooooooooooooooooooooovoooooovvooovooovooooovoooooovoooooovoooooovooovoooovoooovoooooooooooovoovvoovoooooovvoooooooooovvooovoovvvovoooooooovooovovvoovooooovoooovoooooovooooovoooooooooooooooovooooooovooooovvvoooooovvoovvvooooovoovooooovovoovoooooooooooooooooovoooovooovoooooooooooovvoooooooooooooovooovoooovooooooooooovoooooooooovoooooovoooooovvooooooovooooooooovoooooooovovvooooovooooovooooooooooovovooooooooooooooovoooooovooooovoooooooovooooooooooooooooooooooovoooooovoooooooooooooooooooovvoooooooooooooooooovoooooovooovooooooooooovvvvooooovooovoooooooooooovvovooooooovoovvoooooovooooovoooooooovoooovvooooovovvoovoovovooovooooooovoovovooooooooooooooooovooovvooooooooooovooooooooooooovoooovoooooooovoooooooooooovvovoovooooooooooooooooovooooooooooooooooooovovovovooooovoooovoovoooooooooooooooooovvooovoovovoovoooooooooovooovoooooovvooovvooooooooooooovoooooooooooooooovooooooovoooooooooooooovovoovvooooovoovvvooooovoooooooooooovoooooovooooooooovoovooooooooooooovoooooooovoooooooooovoooooooooovoovoooooovvvooooooooovvoooovvooooooooovovooooooovooooooooovoovooooovoooooovoooooooooovoovoooooooooooooovovooovvoooooovoooooovooooovvooooooooovvooooooooovovoooooooovoovovooooooooooooooovoovooooooooooooovovoooovooooooooooovvoooooooooovvovoooooooooooooooooooooooooovoooooooooooooooovovooooooooooooooooooovoooooooooooooooooooovooooooooovooooooovoooovvooooooovovooooovooovooooovoooooooooovoooooovooooooooooooooooooovoooooooooovooovvvovooooooovoooooooooooovoooovooooovoooovooooovvooooooooovvooooo"

let output = largestMerge(word1, word2)

print(word1.count, word2.count, output.count)
