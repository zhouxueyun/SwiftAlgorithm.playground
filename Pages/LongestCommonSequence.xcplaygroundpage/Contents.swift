
import Foundation

class Solution {
    
    func longestCommonSequence(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        var dp = [[Int]](repeating: [Int](repeating: 0, count: arr2.count + 1), count: arr1.count + 1)
        var c = [[Int]](repeating: [Int](repeating: 0, count: arr2.count + 1), count: arr1.count + 1)
        for i in 1...arr1.count {
            for j in 1...arr2.count {
                if arr1[i-1] == arr2[j-1] {
                    dp[i][j] = dp[i-1][j-1] + 1
                    c[i][j] = 0 // 0 斜上 、 1 上 、 -1 左
                } else {
                    dp[i][j] = max(dp[i-1][j], dp[i][j-1])
                    c[i][j] = dp[i-1][j] >= dp[i][j-1] ? 1 : -1
                }
            }
        }
        for i in 0..<c.count {
            print(dp[i])
        }
        print()
        for i in 0..<c.count {
            print(c[i])
        }
        print()
        var i = arr1.count
        var j = arr2.count
        var ret = [Int]()
        while i > 0 && j > 0 {
            if c[i][j] == 0 {
                ret.append(arr1[i-1])
                i -= 1
                j -= 1
            } else if c[i][j] == 1 {
                i -= 1
            } else {
                j -= 1
            }
        }
        return ret.reversed()
    }
    
}

let s = Solution()
s.longestCommonSequence([1,3,4,5,5], [2,4,5,5,7,6])
s.longestCommonSequence([1,3,4,5,6,7,7,8], [3,5,7,4,8,6,7,8,2])
