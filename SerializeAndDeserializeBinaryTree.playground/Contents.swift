/*
 
 tags:Google
 
 297. Serialize and Deserialize Binary Tree
 
 Serialization is the process of converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment.

 Design an algorithm to serialize and deserialize a binary tree. There is no restriction on how your serialization/deserialization algorithm should work. You just need to ensure that a binary tree can be serialized to a string and this string can be deserialized to the original tree structure.

 Clarification: The input/output format is the same as how LeetCode serializes a binary tree. You do not necessarily need to follow this format, so please be creative and come up with different approaches yourself.

 Example 1:
 
 Input: root = [1,2,3,null,null,4,5]
 Output: [1,2,3,null,null,4,5]
 Example 2:

 Input: root = []
 Output: []
 Example 3:

 Input: root = [1]
 Output: [1]
 Example 4:

 Input: root = [1,2]
 Output: [1,2]
  
 Constraints:
 The number of nodes in the tree is in the range [0, 104].
 -1000 <= Node.val <= 1000
 
 */


import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Codec {
    func serialize(_ root: TreeNode?) -> String {
        var str: String = ""
        serializeHelper(root, &str)
        return str
    }
    
    func serializeHelper(_ node: TreeNode?, _ str: inout String) {
        if node == nil {
            if str.isEmpty {
                str += "null"
            } else {
                str += ",null"
            }
            return
        }
        if str.isEmpty {
            str += "\(node!.val)"
        } else {
            str += ",\(node!.val)"
        }
        serializeHelper(node!.left, &str)
        serializeHelper(node!.right, &str)
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        var elements: [String] = data.split(separator: ",").map( { String($0) })
        return deserializeHelper(&elements)
    }
    
    func deserializeHelper(_ elements: inout [String]) -> TreeNode? {
        if elements.first == "null" {
            elements.removeFirst()
            return nil
        }
        
        if let num = Int(elements.first!) {
            let root = TreeNode(num)
            elements.removeFirst()
            root.left = deserializeHelper(&elements)
            root.right = deserializeHelper(&elements)
            return root
        }
        return nil
    }
    
}

let root = TreeNode(1, TreeNode(2), TreeNode(3, TreeNode(4), TreeNode(5)))
var codec = Codec()
codec.deserialize(codec.serialize(root))
codec.serialize(root)
