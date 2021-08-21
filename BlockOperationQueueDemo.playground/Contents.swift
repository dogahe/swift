import Foundation

let operation1 = BlockOperation {
    print("Operation 1 is starting")
    Thread.sleep(forTimeInterval: 1)
    print("Operation 1 is finishing")
}

let operation2 = BlockOperation {
    print("Operation 2 is starting")
    Thread.sleep(forTimeInterval: 1)
    print("Operation 2 is finishing")
}

operation2.addDependency(operation1)

// Either 1
/*
print("Adding operations")
let queue = OperationQueue()
queue.addOperation(operation1)
queue.addOperation(operation2)
queue.waitUntilAllOperationsAreFinished()
print("Done!")
*/

// Or 2
print("Adding operations")
let queue1 = OperationQueue()
let queue2 = OperationQueue()
queue1.addOperation(operation1)
queue2.addOperation(operation2)
queue2.waitUntilAllOperationsAreFinished()
print("Done!")
