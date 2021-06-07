/*
716. Max Stack

Design a max stack that supports push, pop, top, peekMax and popMax.

1. push(x) Push element x onto stack.

2. pop() Remove the element on top of the stack and return it.

3. top() Get the element on the top.

4. peekMax() Retrieve the maximum element in the stack.

5. popMax() -- Retrieve the maximum element in the stack, and remove it. if you find more than one maximum elements, only remove the top-most one.

Example 1:

MaxStack stack new MaxStack():

stack.push(5);
stack.push(1);
stack.push(5);
stack.top() -> 5
stack.popMax() 5
stack.top(): > 1
stack.peekMax(): > 5
stack.pop(); 1
stack.top(): 5

Note:

1.-107 <= x <= 107

2. Number of operations won't exceed 10000.

3. The last four operations won't be called when stack is empty.
 */

class MaxStack {
    
    var stack: [Int]
    var maxValue: Int?
    
    init() {
        stack = []
        maxValue = nil
    }
    
    func push(_ x: Int) {
        stack.append(x)
        maxValue = max(maxValue ?? Int.min, x)
    }
    
    func pop() -> Int {
        let top = stack.removeLast()
        if top == maxValue {
            let newMax = stack.max()
            maxValue = newMax
        }
        return top
    }
    
    func top() -> Int {
        return stack.last!
    }
    
    func peekMax() -> Int {
        return maxValue!
    }
    
    func popMax() -> Int {
        let currMax = maxValue!
        for i in 0 ..< stack.count {
            let e = stack[stack.count - 1 - i]
            if e == maxValue {
                stack.remove(at: stack.count - 1 - i)
                break
            }
        }
        maxValue = stack.max()
        return currMax
    }
}


let stack = MaxStack()

stack.push(5)
stack.push(1)
stack.push(5)
stack.top()
stack.popMax()
stack.top()
stack.peekMax()
stack.pop()
stack.top()

