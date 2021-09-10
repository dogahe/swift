
/*
 
 tags:Facebook
 
 273. Integer to English Words
 
 Convert a non-negative integer num to its English words representation.

 Example 1:

 Input: num = 123
 Output: "One Hundred Twenty Three"
 Example 2:

 Input: num = 12345
 Output: "Twelve Thousand Three Hundred Forty Five"
 Example 3:

 Input: num = 1234567
 Output: "One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven"
 Example 4:

 Input: num = 1234567891
 Output: "One Billion Two Hundred Thirty Four Million Five Hundred Sixty Seven Thousand Eight Hundred Ninety One"
  

 Constraints:

 0 <= num <= 231 - 1
 
 */
func numberToWords(_ num: Int) -> String {
    if num <= 20 {
        if let word = simpleNumToWord(num) {
            return word
        }
    } else if num <= 99 {
        let a = num / 10
        let b = num % 10
        var str = simpleNumToWord(a * 10)!
        if b > 0 {
            str += " " + simpleNumToWord(b)!
        }
        return str
    } else if num <= 999 {
        let a = num / 100
        let b = num % 100
        var str = simpleNumToWord(a)! + " " + simpleNumToWord(100)!
        if b > 0 {
            str += " " + numberToWords(b)
        }
        return str
    } else if num <= 999999 {
        let a = num / 1000
        let b = num % 1000
        var str = numberToWords(a) + " " + simpleNumToWord(1000)!
        if b > 0 {
            str += " " + numberToWords(b)
        }
        return str
    } else if num <= 999999999 {
        let a = num / 1000000
        let b = num % 1000000
        var str = numberToWords(a) + " " + simpleNumToWord(1000000)!
        if b > 0 {
            str += " " + numberToWords(b)
        }
        return str
    } else if num <= 999999999999 {
        let a = num / 1000000000
        let b = num % 1000000000
        var str = numberToWords(a) + " " + simpleNumToWord(1000000000)!
        if b > 0 {
            str += " " + numberToWords(b)
        }
        return  str
    }
    return ""
}

func simpleNumToWord(_ num: Int) -> String? {
    let ints = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 30, 40, 50, 60, 70, 80, 90, 100, 1000, 1000000, 1000000000]
    let words = ["Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety", "Hundred", "Thousand", "Million", "Billion"]
    if let index = ints.firstIndex(of: num) {
        return words[index]
    }
    return nil
}

let num = 123
numberToWords(num)

let num3 = 12345
numberToWords(num3)

let num2 = 1829819998
numberToWords(num2)

let num4 = 1234567
numberToWords(num4)

let num5 = 1000010
numberToWords(num5)

