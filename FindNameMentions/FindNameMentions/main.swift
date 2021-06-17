//
//  main.swift
//  FindNameMentions
//
//  Created by Behzad Dogahe on 6/16/21.
//

class Mention {

    typealias WordAndRange = (word: String, range: Range<String.Index>)

    var name: String

    init(name: String) {
        self.name = name
    }

    func nameIndex(at location: Int) -> String.Index {
        return name.index(name.startIndex, offsetBy: location)
    }

    func wordAndRange(at location: String.Index) -> WordAndRange? {
        var startIndex = location
        var endIndex = location
        
        if name[startIndex] == " " {
            let range = startIndex..<endIndex
             return (" ", range)
        }
        
        while true {
            if startIndex > name.startIndex {
                let searchIndex = name.index(startIndex, offsetBy: -1)
                
                guard !name[searchIndex].isWhitespace else {
                    break
                }
                startIndex = searchIndex
            } else {
                break
            }
        }
        
        while true {
            if endIndex < name.endIndex {
                guard !name[endIndex].isWhitespace else {
                    break
                }
                endIndex = name.index(endIndex, offsetBy: 1)
            } else {
                break
            }
        }

        let range = startIndex..<endIndex
        return (String(name[range]), range)
    }

    func printWord(_ word: WordAndRange) {
        print("word: \(word.word)")
        print("range: \(word.range.lowerBound.utf16Offset(in: name))..<\(word.range.upperBound.utf16Offset(in: name))")
    }
}

let mention = Mention(name: "Behzad Dogahe")
print(mention.name)
if let word = mention.wordAndRange(at: mention.nameIndex(at: 6)) {
    mention.printWord(word)
}



