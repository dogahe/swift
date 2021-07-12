//
//  main.swift
//  WordCount
//
//  Created by Behzad Dogahe on 7/11/21.
//

/*
 
 Given a rectangular matrix of English lowercase letters board and a string word, your task is to find the number of occurrences of word in the rows(→), columns(↓) and diagonals(↘) of board.

 Example

 For

 board = [['s', 'o', 's', 'o'],
          ['s', 'o', 'o', 's'],
          ['s', 's', 's', 's']]
 and word = "sos", the output should be wordCount(board, word) = 3.

 There are 2 occurrences of word starting from board[0][0](going → and ↘), and one starting from board[0][2](going ↓).

 No other occurrences of word were counted, so the answer is 3.

 For

 board = [['a', 'a'],
          ['a', 'a']]
 and word = "aa", the output should be
 wordCount(board, word) = 5.

 There are 2 horizontal, 2, vertical, and 1 diagonal occurrence of word, for a total of 5.

 Input/Output

 [execution time limit] 5 seconds (swift)

 [input] array.array.char board

 A rectangular matrix of lowercase English letters.

 Guaranteed constraints:
 1 ≤ board.length ≤ 100,
 1 ≤ board[0].length ≤ 100,
 board[i].length = board[0].length.

 [input] string word

 A string consisting of lowercase English letters.

 Guaranteed constraints:
 2 ≤ word.length ≤ 100.

 [output] integer

 The number of occurrences of word in the rows(→), columns(↓) and diagonals(↘) of board.
 
 
 
 */

func wordCount(board: [[Character]], word: String) -> Int {
    let wordChar = word[word.index(word.startIndex, offsetBy: 0)]
    var counter: Int = 0
    for i in 0 ..< board.count {
        for j in 0 ..< board[0].count {
            if board[i][j] == wordChar {
                searchWord(String(word.suffix(word.count - 1)), board, i, j, &counter)
            }
        }
    }
    return counter
}

func searchWord(_ word: String, _ board: [[Character]], _ i: Int, _ j: Int, _ counter: inout Int, _ movement: (Int, Int)? = nil) {
    if word.isEmpty {
        counter += 1
        return
    }
    let wordChar = word[word.index(word.startIndex, offsetBy: 0)]
    if let movement = movement {
        let nextI = i + movement.0
        let nextJ = j + movement.1
        if isSafe(nextI, nextJ, board) && board[nextI][nextJ] == wordChar  {
            searchWord(String(word.suffix(word.count - 1)), board, nextI, nextJ, &counter, movement)
        }
    } else {
        let movements: [(Int, Int)] = [(0, 1), (1, 1), (1, 0)]
        for movement in movements {
            let nextI = i + movement.0
            let nextJ = j + movement.1
            if isSafe(nextI, nextJ, board) && board[nextI][nextJ] == wordChar  {
                searchWord(String(word.suffix(word.count - 1)), board, nextI, nextJ, &counter, movement)
            }
        }
    }
}

func isSafe(_ i: Int, _ j: Int, _ board: [[Character]]) -> Bool {
    return i >= 0 && i < board.count && j >= 0 && j < board[0].count
}



let board: [[Character]] =
    [["s", "o", "s", "o"],
     ["s", "o", "o", "s"],
     ["s", "s", "s", "s"]]

let word = "sos"
let c = wordCount(board: board, word: word)
print(c)


let board2: [[Character]] =
    [["a", "a"],
     ["a", "a"]]

let word2 = "aa"
let c2 = wordCount(board: board2, word: word2)
print(c2)



