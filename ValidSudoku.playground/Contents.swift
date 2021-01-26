/*

36. Valid Sudoku
 
 Determine if a 9 x 9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:

 Each row must contain the digits 1-9 without repetition.
 Each column must contain the digits 1-9 without repetition.
 Each of the nine 3 x 3 sub-boxes of the grid must contain the digits 1-9 without repetition.
 Note:

 A Sudoku board (partially filled) could be valid but is not necessarily solvable.
 Only the filled cells need to be validated according to the mentioned rules.
  

 Example 1:
 
 Input: board =
 [["5","3",".",".","7",".",".",".","."]
 ,["6",".",".","1","9","5",".",".","."]
 ,[".","9","8",".",".",".",".","6","."]
 ,["8",".",".",".","6",".",".",".","3"]
 ,["4",".",".","8",".","3",".",".","1"]
 ,["7",".",".",".","2",".",".",".","6"]
 ,[".","6",".",".",".",".","2","8","."]
 ,[".",".",".","4","1","9",".",".","5"]
 ,[".",".",".",".","8",".",".","7","9"]]
 Output: true
 
 Example 2:

 Input: board =
 [["8","3",".",".","7",".",".",".","."]
 ,["6",".",".","1","9","5",".",".","."]
 ,[".","9","8",".",".",".",".","6","."]
 ,["8",".",".",".","6",".",".",".","3"]
 ,["4",".",".","8",".","3",".",".","1"]
 ,["7",".",".",".","2",".",".",".","6"]
 ,[".","6",".",".",".",".","2","8","."]
 ,[".",".",".","4","1","9",".",".","5"]
 ,[".",".",".",".","8",".",".","7","9"]]
 Output: false
 
 Explanation: Same as Example 1, except with the 5 in the top left corner being modified to 8. Since there are two 8's in the top left 3x3 sub-box, it is invalid.
  

 Constraints:

 board.length == 9
 board[i].length == 9
 board[i][j] is a digit or '.'.
 
 */

func isValidSudoku(_ board: [[Character]]) -> Bool {
    for row in 0 ..< board.count {
        var digits: [Int] = Array(repeating: 0, count: board.count)
        for col in 0 ..< board.count {
            let element = board[row][col]
            if element.isNumber {
                if let num = element.wholeNumberValue {
                    if num > 0 && num < 10 {
                        digits[num - 1] =  digits[num - 1] + 1
                    } else {
                        return false
                    }
                }
            }
        }
        if let maxCount = digits.max(), maxCount > 1 {
            return false
        }
    }
    for col in 0 ..< board.count {
        var digits: [Int] = Array(repeating: 0, count: board.count)
        for row in 0 ..< board.count {
            let element = board[row][col]
            if element.isNumber {
                if let num = element.wholeNumberValue {
                    if num > 0 && num < 10 {
                        digits[num - 1] =  digits[num - 1] + 1
                    } else {
                        return false
                    }
                }
            }
        }
        if let maxCount = digits.max(), maxCount > 1 {
            return false
        }
    }
    for i in 0 ... 2 {
        for j in 0 ... 2 {
            var digits: [Int] = Array(repeating: 0, count: board.count)
            for row in i*3 ... i*3 + 2 {
                for col in j*3 ... j*3 + 2 {
                    let element = board[row][col]
                    if element.isNumber {
                        if let num = element.wholeNumberValue {
                            digits[num - 1] =  digits[num - 1] + 1
                        }
                    }
                }
            }
            if let maxCount = digits.max(), maxCount > 1 {
                return false
            }
        }
    }
    return true
}

let board: [[Character]] =
    [["5","3",".",".","7",".",".",".","."]
     ,["6",".",".","1","9","5",".",".","."]
     ,[".","9","8",".",".",".",".","6","."]
     ,["8",".",".",".","6",".",".",".","3"]
     ,["4",".",".","8",".","3",".",".","1"]
     ,["7",".",".",".","2",".",".",".","6"]
     ,[".","6",".",".",".",".","2","8","."]
     ,[".",".",".","4","1","9",".",".","5"]
     ,[".",".",".",".","8",".",".","7","9"]]

print(isValidSudoku(board))
