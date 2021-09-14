//
//  main.swift
//  RotationalCipher
//
//  Created by Behzad Dogahe on 5/10/21.
//

/*
 
 tags:Facebook
 
 Rotational Cipher
 
 One simple way to encrypt a string is to "rotate" every alphanumeric character by a certain amount. Rotating a character means replacing it with another character that is a certain number of steps away in normal alphabetic or numerical order.
 For example, if the string "Zebra-493?" is rotated 3 places, the resulting string is "Cheud-726?". Every alphabetic character is replaced with the character 3 letters higher (wrapping around from Z to A), and every numeric character replaced with the character 3 digits higher (wrapping around from 9 to 0). Note that the non-alphanumeric characters remain unchanged.
 Given a string and a rotation factor, return an encrypted string.
 Signature
 string rotationalCipher(string input, int rotationFactor)
 Input
 1 <= |input| <= 1,000,000
 0 <= rotationFactor <= 1,000,000
 Output
 Return the result of rotating input a number of times equal to rotationFactor.
 Example 1
 input = Zebra-493?
 rotationFactor = 3
 output = Cheud-726?
 Example 2
 input = abcdefghijklmNOPQRSTUVWXYZ0123456789
 rotationFactor = 39
 output = nopqrstuvwxyzABCDEFGHIJKLM9012345678

 */


struct RotationalCipher {
    let backing: String
    
    func cipher(withRotationFactor rotationFactor: Int) -> String {
        var output: String = ""
        for i in 0 ..< backing.count {
            let c = backing[backing.index(backing.startIndex, offsetBy: i)]
            if c.isNumber {
                if let num = Int(String(c)) {
                    let rotate = rotationFactor % 10
                    output.append("\((num + rotate)%10)")
                }
            } else if c.isLetter {
                let rotate = rotationFactor % 26
                if c.isLowercase {
                    let aChar: Character = "a"
                    let newCode = (c.asciiValue! + UInt8(rotate) - aChar.asciiValue!)%26 + aChar.asciiValue!
                    output.append(String(UnicodeScalar(newCode)))
                } else if c.isUppercase {
                    let AChar: Character = "A"
                    let newCode = (c.asciiValue! + UInt8(rotate) - AChar.asciiValue!)%26 + AChar.asciiValue!
                    output.append(String(UnicodeScalar(newCode)))
                }
            } else {
                output.append(String(c))
            }
        }
        return output
    }
}

// These are the tests we use to determine if the solution is correct.
// You can add your own at the bottom, but they are otherwise not editable!

private extension String {
    var characterArray: String {
        return "[\"\(self)\"]"
    }
}

private var testCaseNumber = 1;
 
private extension RotationalCipher {
    static func check(_ expectedValue: String, against output: String) {
        let rightTick = "\u{2713}";
        let wrongTick = "\u{2717}";
    
        let result = expectedValue == output
        if result {
            print("\(rightTick) Test #\(testCaseNumber)")
        } else {
            print("\(wrongTick) Test #\(testCaseNumber) Expected: \(expectedValue.characterArray) Your output: \(output.characterArray)")
        }
        testCaseNumber += 1
    }
}

let input1 = "All-convoYs-9-be:Alert1."
let expected1 = "Epp-gsrzsCw-3-fi:Epivx5."
let output1 = RotationalCipher(backing: input1).cipher(withRotationFactor: 4)
print(output1)
RotationalCipher.check(expected1, against: output1)

let input2 = "abcdZXYzxy-999.@"
let expected2 = "stuvRPQrpq-999.@"
let output2 = RotationalCipher(backing: input2).cipher(withRotationFactor: 200)
print(output2)
RotationalCipher.check(expected2, against: output2)
