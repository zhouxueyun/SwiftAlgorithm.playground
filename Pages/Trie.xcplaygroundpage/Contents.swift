
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

class Trie {
    
    var isLeaf: Bool
    var childs: [Character: Trie]
    
    /** Initialize your data structure here. */
    init() {
        self.isLeaf = false
        self.childs = [Character: Trie]()
    }
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        if word.isEmpty { return }
        let wordArr = Array(word)
        var t = self
        for i in 0..<wordArr.count {
            var child = t.childs[wordArr[i]]
            if child == nil {
                child = Trie()
                t.childs[wordArr[i]] = child
            }
            t = child!
        }
        t.isLeaf = true
    }
    
    func remove(_ word: String) {
        if word.isEmpty { return }
        let wordArr = Array(word)
        var t = self
        for i in 0..<wordArr.count {
            if let child = t.childs[wordArr[i]] { t = child }
            else { return }
        }
        t.isLeaf = false
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        let wordArr = Array(word)
        var t = self
        for i in 0..<wordArr.count {
            if let child = t.childs[wordArr[i]] { t = child }
            else { return false }
        }
        return t.isLeaf
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        let prefixArr = Array(prefix)
        var t = self
        for i in 0..<prefixArr.count {
            if let child = t.childs[prefixArr[i]] { t = child }
            else { return false }
        }
        return true
    }
    
    func printTrie() {
        var queue = [Trie]()
        queue.append(self)
        while !queue.isEmpty {
            var newQueue = [Trie]()
            for node in queue {
                print(node.isLeaf, terminator: " ")
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

