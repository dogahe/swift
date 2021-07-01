/*
 
946. Validate Stack Sequences

 Given two sequences pushed and popped with distinct values, return true if and only if this could have been the result of a sequence of push and pop operations on an initially empty stack.

 Example 1:
 Input: pushed = [1,2,3,4,5], popped = [4,5,3,2,1]
 Output: true
 Explanation: We might do the following sequence:
 push(1), push(2), push(3), push(4), pop() -> 4,
 push(5), pop() -> 5, pop() -> 3, pop() -> 2, pop() -> 1
 
 Example 2:
 Input: pushed = [1,2,3,4,5], popped = [4,3,5,1,2]
 Output: false
 Explanation: 1 cannot be popped before 2.
  

 Constraints:
 0 <= pushed.length == popped.length <= 1000
 0 <= pushed[i], popped[i] < 1000
 pushed is a permutation of popped.
 pushed and popped have distinct values.

 */
func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
    var stack: [Int] = []
    var i = 0
    var j = 0
    while i < pushed.count || j < popped.count {
        let num = popped[j]
        if stack.last == num {
            stack.removeLast()
            j += 1
        } else {
            if i >= pushed.count {
               return false
            } else {
                stack.append(pushed[i])
                i += 1
            }
        }
    }
    return stack.isEmpty
}

let pushed = [1,2,3,4,5]
let popped = [4,5,3,2,1]
let result = validateStackSequences(pushed, popped)
print(result)

let pushed2 = [1,2,3,4,5]
let popped2 = [4,3,5,1,2]
let result2 = validateStackSequences(pushed2, popped2)
print(result2)
