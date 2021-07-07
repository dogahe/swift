import Foundation
func removeComments(_ source: [String]) -> [String] {
    var open = false
    var inTheMiddle = false
    var output: [String] = []
    for line in source {
        if !open {
            if let range = line.range(of: "//") {
                let sub = line[ ..<range.lowerBound ]
                if !sub.isEmpty {
                    output.append(String(sub))
                }
            } else if let range = line.range(of: "/*") {
                
                let start = line.index(line.startIndex, offsetBy: Int(range.upperBound))
                let end = myString.index(myString.startIndex, offsetBy: 4)
                let myRange = start..<end
                
                if let e = line.range(of: "*/", options: [], range: Range(NSRange(location: 3, length: 2)), locale: nil) {
                    
                }
                if let endRange = line.range(of: "*/") {
                    let sub = line[ ..<range.lowerBound ] + line[ endRange.upperBound... ]
                    if !sub.isEmpty {
                        output.append(String(sub))
                    }
                } else {
                    let sub = line[ ..<range.lowerBound ]
                    if !sub.isEmpty {
                        output.append(String(sub))
                        inTheMiddle = true
                    }
                    open = true
                }
            } else {
                output.append(line)
            }
        } else {
            if let range = line.range(of: "*/") {
                let sub = line[ range.upperBound... ]
                if !sub.isEmpty {
                    if inTheMiddle {
                        let last =  output.removeLast()
                        output.append(last + String(sub))
                    } else {
                        output.append(String(sub))
                    }
                }
                open = false
            }
        }
    }
    return output
}

let source = ["/*Test program */", "int main()", "{ ", "  // variable declaration ", "int a, b, c;", "/* This is a test", "   multiline  ", "   comment for ", "   testing */", "a = b + c;", "}"]
let output = removeComments(source)
print(output)

let source2 = ["a/*comment", "line", "more_comment*/b"]
let output2 = removeComments(source2)
print(output2)

let source3 = ["struct Node{", "    /*/ declare members;/**/", "    int size;", "    /**/int val;", "};"]
let output3 = removeComments(source3)
print(output3)
