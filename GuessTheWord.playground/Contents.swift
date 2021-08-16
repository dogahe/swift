/*
 
 tags:Google
 
 843. Guess the Word
 
 This is an interactive problem.

 You are given an array of unique strings wordlist where wordlist[i] is 6 letters long, and one word in this list is chosen as secret.

 You may call Master.guess(word) to guess a word. The guessed word should have type string and must be from the original list with 6 lowercase letters.

 This function returns an integer type, representing the number of exact matches (value and position) of your guess to the secret word. Also, if your guess is not in the given wordlist, it will return -1 instead.

 For each test case, you have exactly 10 guesses to guess the word. At the end of any number of calls, if you have made 10 or fewer calls to Master.guess and at least one of these guesses was secret, then you pass the test case.

  

 Example 1:
 Input: secret = "acckzz", wordlist = ["acckzz","ccbazz","eiowzz","abcczz"], numguesses = 10
 Output: You guessed the secret word correctly.
 Explanation:
 master.guess("aaaaaa") returns -1, because "aaaaaa" is not in wordlist.
 master.guess("acckzz") returns 6, because "acckzz" is secret and has all 6 matches.
 master.guess("ccbazz") returns 3, because "ccbazz" has 3 matches.
 master.guess("eiowzz") returns 2, because "eiowzz" has 2 matches.
 master.guess("abcczz") returns 4, because "abcczz" has 4 matches.
 We made 5 calls to master.guess and one of them was the secret, so we pass the test case.
 
 Example 2:
 Input: secret = "hamada", wordlist = ["hamada","khaled"], numguesses = 10
 Output: You guessed the secret word correctly.
  

 Constraints:

 1 <= wordlist.length <= 100
 wordlist[i].length == 6
 wordlist[i] consist of lowercase English letters.
 All the strings of wordlist are unique.
 secret exists in wordlist.
 numguesses == 10
 
 */
class Master {
  public func guess(word: String) -> Int {
    return match(word, "azzzzz")
  }
}

func match(_ s1: String, _ s2: String) -> Int {
    let s1Arr: [Character] = Array(s1)
    let s2Arr: [Character] = Array(s2)
    var sum = 0
    for i in 0 ..< s1.count {
        if s1Arr[i] == s2Arr[i] {
            sum += 1
        }
    }
    return sum
}

func findSecretWord(_ wordlist: [String], _ master: Master) {
    var wordlist2 = wordlist
    var matches = 0
    var tries = 1
    while tries < 10 && matches < 6 {
        var dict: [String: Int] = [:]
        for w1 in wordlist2 {
            for w2 in wordlist2 {
                if match(w1, w2) == 0 {
                    if let val = dict[w1] {
                        dict[w1] = val + 1
                    } else {
                        dict[w1] = 1
                    }
                }
            }
        }
        var minZeroMatches = Int.max
        var minZeroMatchWord: String = wordlist2[0]
        for (_, (key, value)) in dict.enumerated() {
            if value <= minZeroMatches {
                minZeroMatches = value
                minZeroMatchWord = key
            }
        }
        matches = master.guess(word: minZeroMatchWord)
        var temp: [String] = []
        for i in 0 ..< wordlist2.count {
            if match(wordlist2[i], minZeroMatchWord) == matches {
                temp.append(wordlist2[i])
            }
        }
        wordlist2 = temp
        print(minZeroMatchWord, wordlist2.count, wordlist2)
        tries += 1
    }
}


let master = Master()
let wordlist = ["zbcdef","acdefg","adefgh","aefghi","afghij","aghijk","ahijkl","aijklm","ajklmn","aklmno","almnoz","anopqr","azzzzz"]


findSecretWord(wordlist, master)
