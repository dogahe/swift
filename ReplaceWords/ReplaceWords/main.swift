//
//  main.swift
//  ReplaceWords
//
//  Created by Behzad Dogahe on 1/28/21.
//

import Foundation

class Trie {
    let size: Int = 26
    var children: [Trie?] = Array(repeating: nil, count: 26)
    var isLeaf: Bool
    init() {
        isLeaf = false
        for i in 0 ..< size {
            children[i] = nil
        }
    }
    
    func insert(_ word: String) {
        var curr: Trie? = self
        for i in 0 ..< word.count {
            let char = word[word.index(word.startIndex, offsetBy: i)]
            let A: Character = "a"
            if let charVal = char.asciiValue, let aVal = A.asciiValue {
                let childIndex = Int(charVal - aVal)
                if curr?.children[childIndex] == nil {
                    curr?.children[childIndex] = Trie()
                }
                curr = curr?.children[childIndex]
            }
        }
        curr?.isLeaf = true
    }
}


func replaceWords(_ dictionary: [String], _ sentence: String) -> String {
    let words: [String] = sentence.split(separator: " ").map( { String($0) })
    let trie: Trie = Trie()
    for word in dictionary {
        trie.insert(word)
    }
    var output: String = ""
    for word in words {
        let replaced = replace(word, trie)
        output += replaced + " "
    }
    return output.trimmingCharacters(in: .whitespacesAndNewlines)
}

func replace(_ word: String, _ trie: Trie) -> String {
    var curr: Trie? = trie
    for i in 0 ..< word.count {
        let char: Character = word[word.index(word.startIndex, offsetBy: i)]
        let A: Character = "a"
        if let charVal = char.asciiValue, let aVal = A.asciiValue {
            let childIndex = Int(charVal - aVal)
            if curr?.children[childIndex] == nil {
                return word
            }
            curr = curr?.children[childIndex]
            if let isLeaf = curr?.isLeaf {
                if isLeaf {
                    return String(word.prefix(i + 1))
                }
            }
        }
    }
    return word
}



let dictionary = ["cat","bat","rat"]
let sentence = "the cattle was rattled by the battery"

//let dictionary = ["a", "aa", "aaa", "aaaa"]
//let sentence = "a s aa a aaaa aaa aaa aaa aaaaaa bbb baba ababa"

//let dictionary = ["e","k","c","harqp","h","gsafc","vn","lqp","soy","mr","x","iitgm","sb","oo","spj","gwmly","iu","z","f","ha","vds","v","vpx","fir","t","xo","apifm","tlznm","kkv","nxyud","j","qp","omn","zoxp","mutu","i","nxth","dwuer","sadl","pv","w","mding","mubem","xsmwc","vl","farov","twfmq","ljhmr","q","bbzs","kd","kwc","a","buq","sm","yi","nypa","xwz","si","amqx","iy","eb","qvgt","twy","rf","dc","utt","mxjfu","hm","trz","lzh","lref","qbx","fmemr","gil","go","qggh","uud","trnhf","gels","dfdq","qzkx","qxw"]

/*
let sentence = "ikkbp miszkays wqjferqoxjwvbieyk gvcfldkiavww vhokchxz dvypwyb bxahfzcfanteibiltins ueebf lqhflvwxksi dco kddxmckhvqifbuzkhstp wc ytzzlm gximjuhzfdjuamhsu gdkbmhpnvy ifvifheoxqlbosfww mengfdydekwttkhbzenk wjhmmyltmeufqvcpcxg hthcuovils ldipovluo aiprogn nusquzpmnogtjkklfhta klxvvlvyh nxzgnrveghc mpppfhzjkbucv cqcft uwmahhqradjtf iaaasabqqzmbcig zcpvpyypsmodtoiif qjuiqtfhzcpnmtk yzfragcextvx ivnvgkaqs iplazv jurtsyh gzixfeugj rnukjgtjpim hscyhgoru aledyrmzwhsz xbahcwfwm hzd ygelddphxnbh rvjxtlqfnlmwdoezh zawfkko iwhkcddxgpqtdrjrcv bbfj mhs nenrqfkbf spfpazr wrkjiwyf cw dtd cqibzmuuhukwylrnld dtaxhddidfwqs bgnnoxgyynol hg dijhrrpnwjlju muzzrrsypzgwvblf zbugltrnyzbg hktdviastoireyiqf qvufxgcixvhrjqtna ipfzhuvgo daee r nlipyfszvxlwqw yoq dewpgtcrzausqwhh qzsaobsghgm ichlpsjlsrwzhbyfhm ksenb bqprarpgnyemzwifqzz oai pnqottd nygesjtlpala qmxixtooxtbrzyorn gyvukjpc s mxhlkdaycskj uvwmerplaibeknltuvd ocnn frotscysdyclrc ckcttaceuuxzcghw pxbd oklwhcppuziixpvihihp"
 */

//let sentence = "gyvukjpc b mxhlkdaycskj"

print(replaceWords(dictionary, sentence))
