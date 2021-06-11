import UIKit

let parent = UIView(frame: CGRect(x: 0, y: 0, width: 250, height: 250))
let subview1 = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
let subview2 = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
let subview3 = UIView(frame: CGRect(x: 30, y: 30, width: 50, height: 25))
let subview4 = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
let subview5 = UIView(frame: CGRect(x: 50, y: 50, width: 50, height: 50))

parent.addSubview(subview1)
parent.addSubview(subview2)
subview1.addSubview(subview3)
subview2.addSubview(subview4)
subview2.addSubview(subview5)

  
func printSubviews(_ root: UIView?) {
  if root == nil {
    print("No Views")
  }
  helper(root, 0)
}

func helper(_ node: UIView?, _ level: Int) {
  if node == nil {
    return
  }
  let str = String(repeating: "   | ", count: level)
  print("\(str) \(node!)")
  let children = node!.subviews
  for child in children {
      helper(child, level + 1)
  }
}

printSubviews(parent)
print("==========")
print(parent.value(forKey: "recursiveDescription")!)
