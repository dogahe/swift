//
//  main.swift
//  RotationalCipher
//
//  Created by Behzad Dogahe on 5/10/21.
//

/*
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

let input1 = "All-convoYs-9-be:Alert1."
let expected1 = "Epp-gsrzsCw-3-fi:Epivx5."
let output1 = RotationalCipher(backing: input1).cipher(withRotationFactor: 4)
print(output1)


let input2 = "abcdZXYzxy-999.@"
let expected2 = "stuvRPQrpq-999.@"
let output2 = RotationalCipher(backing: input2).cipher(withRotationFactor: 200)
print(output2)
