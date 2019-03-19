
import Foundation

class MinMaxStack {
    
    var stack: [Int]
    var minStack: [Int]
    var maxStack: [Int]
    
    init() {
        stack = [Int]()
        minStack = [Int]()
        maxStack = [Int]()
    }
    
    func size() -> Int {
        return stack.count
    }
    
    func isEmpty() -> Bool {
        return stack.isEmpty
    }
    
    func push(_ val: Int) {
        stack.append(val)
        let min = minStack.last
        if min == nil || min! >= val {
            minStack.append(val)
        }
        let max = maxStack.last
        if max == nil || max! <= val {
            maxStack.append(val)
        }
    }
    
    func pop() -> Int? {
        if stack.isEmpty {
            return nil
        }
        let top = stack.popLast()!
        if let min = minStack.last, min == top {
            minStack.popLast()
        }
        if let max = maxStack.last, max == top {
            maxStack.popLast()
        }
        return top
    }
    
    func top() -> Int? {
        return stack.last
    }
    
    func min() -> Int? {
        return minStack.last
    }
    
    func max() -> Int? {
        return maxStack.last
    }
    
    func printElement() {
        print(stack)
        print(minStack)
        print(maxStack)
        print()
    }
}

let stack = MinMaxStack()
stack.push(3)
stack.push(2)
stack.push(4)
stack.push(1)
stack.push(5)

stack.printElement()
stack.min()
stack.max()

stack.pop()
stack.pop()

stack.printElement()
stack.min()
stack.max()


