import Foundation

func decodeAtIndex(_ S: String, _ K: Int) -> String {
    var tape: String = ""
    var index: Int = 0
    while index < S.count {
        let c = S[S.index(S.startIndex, offsetBy: index)]
        if !c.isNumber {
            tape = tape + String(c)
        } else {
            if let num = c.wholeNumberValue {
                tape = String(repeating: tape, count: num)
            }
        }
        if tape.count >= K {
            return String(tape[tape.index(tape.startIndex, offsetBy: K - 1)])
        }
        index += 1
    }
    return String(tape[tape.index(tape.startIndex, offsetBy: K - 1)])
}

let S = "a2345678999999999999999"
let K = 1

decodeAtIndex(S, K)
