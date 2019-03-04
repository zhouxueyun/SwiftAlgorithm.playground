
import Foundation

class Solution {
    
    func getNext(_ pattern: String) -> [Int] {
        let pArr = Array(pattern)
        var next = [Int](repeating: 0, count: pArr.count)
        next[0] = -1
        var k = -1
        var j = 0
        while j < pArr.count - 1 {
            if k == -1 || pArr[j] == pArr[k] {
                j += 1
                k += 1
                if pArr[j] == pArr[k] {
                    next[j] = next[k]
                } else {
                    next[j] = k
                }
            } else {
                k = next[k]
            }
        }
        return next
    }
    
    func firstAppearIndex(_ str: String, _ pattern: String) -> Int {
        var i = 0
        var j = 0
        let next = getNext(pattern)
        let sArr = Array(str)
        let pArr = Array(pattern)
        while i < sArr.count && j < pArr.count {
            if j == -1 || sArr[i] == pArr[j] {
                i += 1
                j += 1
            } else {
                j = next[j]
            }
        }
        if j == pattern.count {
            return i - j
        }
        return -1
    }
    
}

let s = Solution()
s.firstAppearIndex("bbc abcdab abcdabcdabde", "abcdabd")
s.firstAppearIndex("abacababc", "abab")
s.firstAppearIndex("ssssssssssssssssa", "ssssa")
