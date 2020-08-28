// Add and Search Word - Data structure design
// You should design a data structure that supports adding new words and finding if a string matches any previously added string.
// Implement the WordDictionary class:
// WordDictionary() Initializes the object.
// void addWord(word) adds word to the data structure, it can be matched later.
// bool search(word) returns true if there is any string in the data structure that matches word or false otherwise. word may contain dots '.' where dots can be matched with any letter.
// Explanation
// WordDictionary wordDictionary = new WordDictionary();
// wordDictionary.addWord("bad");
// wordDictionary.addWord("dad");
// wordDictionary.addWord("mad");
// wordDictionary.search("pad"); // return False
// wordDictionary.search("bad"); // return True
// wordDictionary.search(".ad"); // return True
// wordDictionary.search("b.."); // return True
// Constraints:
// 1 <= word.length <= 500
// word in addWord consists lower-case English letters.
// word in search consist of  '.' or lower-case English letters.
// At most 50000 calls will be made to addWord and search .
// Hint: You should be familiar with how a Trie works. If not, please work on this problem: Implement Trie (Prefix Tree) first.

let str = "abd"
import Foundation

class WordDictionary {

    init() {
        
    }
    
    func addWord(_ word: String) {
        
    }
    
    func search(_ word: String) -> Bool {
        return false
    }
}


let obj = WordDictionary()
obj.addWord(str)
let ret_2: Bool = obj.search(str)

