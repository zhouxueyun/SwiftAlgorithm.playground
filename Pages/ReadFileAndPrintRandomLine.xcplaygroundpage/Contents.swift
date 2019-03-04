
import Foundation

class Solution {
    
    func readFileAndPrintRandomLine(_ filePath: String, _ n: Int) {
        let data = FileManager.default.contents(atPath: filePath)!
        let content = String(data: data, encoding: .utf8)!
        printTextRandomLines(content, n)
    }
    
    func printTextRandomLines(_ content: String, _ n: Int) {
        let components = content.components(separatedBy: "\n")
        let randomNumbers = generateRandomLineNumber(components.count, n)
        for lineNo in randomNumbers {
            print(components[lineNo])
        }
    }
    
    func generateRandomLineNumber(_ bound: Int, _ count: Int) -> [Int] {
        var seeds = (0..<bound).map( { $0 } )
        var result = [Int]()
        while seeds.count > 0 && result.count < count {
            let index = Int(arc4random()) % seeds.count
            let number = seeds.remove(at: index)
            result.append(number)
        }
        return result
    }
    
}

let s = Solution()
s.printTextRandomLines(
    """
hahha
hahigha
haighiahgha

hagihaihg
ahgiahig
etgg
gasg
sgaiie
sghihsgis
"""
    , 5)

