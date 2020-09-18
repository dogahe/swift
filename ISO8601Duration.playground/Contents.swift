import Foundation

//var str = "PT1M41S"
var str = "PT41S"

let trimmed = str[str.index(str.startIndex, offsetBy: 2)..<str.index(str.endIndex, offsetBy: -1)]
let minSec = trimmed.split(separator: "M")
var duration: String = ""
if minSec.count > 1 {
   duration = "\(minSec[0]):\(minSec[1])"
} else {
    duration = "0:\(minSec[0])"
}


