/*
 482. License Key Formatting
 
 You are given a license key represented as a string s that consists of only alphanumeric characters and dashes. The string is separated into n + 1 groups by n dashes. You are also given an integer k.

 We want to reformat the string s such that each group contains exactly k characters, except for the first group, which could be shorter than k but still must contain at least one character. Furthermore, there must be a dash inserted between two groups, and you should convert all lowercase letters to uppercase.

 Return the reformatted license key.

 Example 1:
 Input: s = "5F3Z-2e-9-w", k = 4
 Output: "5F3Z-2E9W"
 Explanation: The string s has been split into two parts, each part has 4 characters.
 Note that the two extra dashes are not needed and can be removed.
 
 Example 2:
 Input: s = "2-5g-3-J", k = 2
 Output: "2-5G-3J"
 Explanation: The string s has been split into three parts, each part has 2 characters except the first part as it could be shorter as mentioned above.
  

 Constraints:
 1 <= s.length <= 105
 s consists of English letters, digits, and dashes '-'.
 1 <= k <= 104
 */
import Foundation

func licenseKeyFormatting(_ s: String, _ k: Int) -> String {
    var s1: String = s
    s1 = s1.replacingOccurrences(of: "-", with: "")
    s1 = s1.uppercased()
    let sections = s1.count / k
    let rem = s1.count % k
    var output: String = ""
    let sArr: [Character] = Array(s1)
    if rem > 0 {
        for i in 0 ..< rem {
            output.append(sArr[i])
        }
        if sections > 0 {
            output.append("-")
        }
    }

    for i in 0 ..< sections {
        for j in 0 ..< k {
            output.append(sArr[rem + i*k + j])
        }
        if i < sections - 1 {
            output.append("-")
        }
    }
    return output
}

let s = "5F3Z-2e-9-w"
let k = 4
licenseKeyFormatting(s, k)

let s2 = "2-5g-3-J"
let k2 = 2
licenseKeyFormatting(s2, k2)
