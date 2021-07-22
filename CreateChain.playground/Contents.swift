/*
 
 Write a function that given this input
 
 let numbers:[String] =
 ["7HTW003 9SQL857",
 "9SQL857 2LLD401",
 "3YAP519 7HTW003",
 "6QVN393 3YAP519"]
 
 creates this output:
 6QVN393
 3YAP519
 7HTW003
 9SQL857
 2LLD401
 
 */

func createSequence(_ numbers: [String]) -> [String] {
    var left: [String] = []
    var right: [String] = []
    var dict: [String:String] = [:]
    for number in numbers {
        let l = String(number.split(separator: " ")[0])
        let r = String(number.split(separator: " ")[1])
        left.append(l)
        right.append(r)
        dict[l] = r
    }
    let leftSet = Set(left)
    let rightSet = Set(right)
    var heads = leftSet
    heads.subtract(rightSet)
    var output: [String] = []
    if let head = heads.first {
        var curr: String? = head
        while curr != nil  {
            output.append(curr!)
            curr = dict[curr!]
        }
    }
    return output
}

let numbers:[String] =
["7HTW003 9SQL857",
"9SQL857 2LLD401",
"3YAP519 7HTW003",
"6QVN393 3YAP519"]

let s = createSequence(numbers)
print(s)
