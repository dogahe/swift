func nextClosestTime(_ time: String) -> String {
    let splits = time.split(separator: ":")
    let hh: [Character] = Array(splits[0])
    let mm: [Character] = Array(splits[1])
    var digits: [Int] = []
    digits.append(contentsOf: hh.map( { $0.wholeNumberValue! } ))
    digits.append(contentsOf: mm.map( { $0.wholeNumberValue! } ))
    digits = Array(Set(digits)).sorted()
    print(digits)
    
    let timeArr: [Character] = Array(time)
    var output: String = ""
    for i in 0 ..< timeArr.count {
        let c = timeArr[timeArr.count - 1 - i]
        let cNum = c.wholeNumberValue!
        if i == 0 {
            var selectedDigit = digits.min()!
            for digit in digits {
                if digit > cNum {
                    selectedDigit = digit
                    output = time.prefix(4) + "\(selectedDigit)"
                    return output
                }
            }
            output = "\(selectedDigit)"
        } else if i == 1 {
            var selectedDigit = digits.min()!
            for digit in digits {
                if digit < 6 && digit > cNum {
                    selectedDigit = digit
                    output = time.prefix(3) + "\(selectedDigit)" + time.suffix(1)
                    return output
                }
                output = "\(selectedDigit)\(output)"
            }
        } else if i == 2 {
            output = ":\(output)"
        } else if i == 3 {
            var selectedDigit = digits.min()!
            for digit in digits {
                if digit > cNum {
                    selectedDigit = digit
                    output = time.prefix(1) + "\(selectedDigit)" + time.suffix(3)
                    return output
                }
            }
            output = "\(selectedDigit)\(output)"
        } else if i == 4 {
            var selectedDigit = digits.min()!
            for digit in digits {
                if digit > cNum && Int("\(digit)\(timeArr[1])")! < 24 {
                    selectedDigit = digit
                    output = "\(selectedDigit)" + time.suffix(4)
                    return output
                }
            }
            output = "\(selectedDigit)\(output)"
        }
        
    }
    return output
}

let time = "19:34"
//nextClosestTime(time)

let time2 = "22:59"
nextClosestTime(time2)
