/*
 22. Generate Parentheses
    
 Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

 Example 1:

 Input: n = 3
 Output: ["((()))","(()())","(())()","()(())","()()()"]
 Example 2:

 Input: n = 1
 Output: ["()"]
  
 Constraints:

 1 <= n <= 8
 
*/

func generateParenthesis(_ n: Int) -> [String] {
    var results: [String] = []
    backtrack("", 0, 0, n, &results)
    return results
}

func backtrack(_ curr: String, _ open: Int, _ close: Int, _ n: Int, _ results: inout [String]) {
    if curr.count == 2 * n {
        results.append(curr)
        return
    }
    if open < n {
        backtrack(curr + "(", open + 1, close, n, &results)
    }
    if close < n && close < open {
        backtrack(curr + ")", open, close + 1, n, &results)
    }
}

let a = generateParenthesis(4)
a.count

