
import Foundation

class TrieNode {
    
    var value: String
    var childs: [Character: TrieNode]
    
    convenience init() {
        self.init("")
    }
    
    init(_ value: String) {
        self.value = value
        self.childs = [Character: TrieNode]()
    }
    
    func append(_ str: String) {
        if str.isEmpty { return }
        let sArr = Array(str)
        var child = childs[sArr[0]]
        if child == nil {
            child = TrieNode(value + String(sArr[0]))
            childs[sArr[0]] = child
        }
        child?.append(String(sArr[1..<sArr.count]))
    }
    
    func remove(_ str: String) {
        if str.isEmpty { return }
        let sArr = Array(str)
        guard let child = childs[sArr[0]] else {
            return
        }
        if sArr.count == 1 {
            if child.childs.isEmpty { // 无子节点，可以删除
                childs[sArr[0]] = nil
            }
        } else {
            child.remove(String(sArr[1..<sArr.count]))
        }
    }
    
    func contains(_ str: String) -> Bool {
        if str.isEmpty { return true }
        let sArr = Array(str)
        if let child = childs[sArr[0]] {
            return child.contains(String(sArr[1..<sArr.count]))
        }
        return false
    }
    
    class func buildTrie(_ strs: [String]) -> TrieNode {
        let root = TrieNode()
        for str in strs {
            root.append(str)
        }
        return root
    }
    
    class func printNode(_ root: TrieNode?) {
        guard let root = root else { return }
        var queue = [TrieNode]()
        queue.append(root)
        while !queue.isEmpty {
            var newQueue = [TrieNode]()
            for node in queue {
                print(node.value, terminator: " ")
                newQueue.append(contentsOf: node.childs.values)
            }
            print()
            queue = newQueue
        }
    }
}

let strs = ["inn", "int", "ate", "age", "adv", "ant"]
let root = TrieNode.buildTrie(strs)
TrieNode.printNode(root)
root.contains("add")

root.append("add")
TrieNode.printNode(root)
root.contains("add")

root.remove("add")
TrieNode.printNode(root)
root.contains("add")

