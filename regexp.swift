// 下記を参考に
// http://qiita.com/tsuruchika/items/9ca9c4811e1f28b9417c
import Foundation
 
class Regexp {
    let internalRegexp: NSRegularExpression
    let pattern: String
    
    init(_ pattern: String) {
        self.pattern = pattern
        do {
            self.internalRegexp = try NSRegularExpression( pattern: pattern, options: [])
        } catch let error as NSError {
            print(error.localizedDescription)
            self.internalRegexp = NSRegularExpression()
        }
    }
    
    func isMatch(input: String) -> Bool {
        let nsString = input as NSString
        let matches = self.internalRegexp.matchesInString( input, options: [], range:NSMakeRange(0, nsString.length) )
        return matches.count > 0
    }
    
    func matches(input: String) -> [String]? {
        if self.isMatch(input) {
            let nsString = input as NSString
            let matches = self.internalRegexp.matchesInString( input, options: [], range:NSMakeRange(0, nsString.length) )
            var results: [String] = []
            for i in 0 ..< matches.count {
                results.append( (input as NSString).substringWithRange(matches[i].range) )
            }
            return results
        }
        return nil
    }

    func delMatches(input:String) -> String {
        var strRet:String = input
        if self.isMatch(input) {
            let matchList = self.matches(input)
            for var i = 0; i < matchList!.count; i++ {
                strRet = strRet.stringByReplacingOccurrencesOfString(matchList![i], withString: "", options: [], range: nil)
            }
        }
        return strRet
    }
}

let hello: String = "Hello Swift!"
let pattern = "[a-zA-Z]+"
print(Regexp(pattern).isMatch(hello))
// => true
print(Regexp(pattern).matches(hello))
// => ["Hello", "Swift"]
print(Regexp("[0-9]+").isMatch(hello))
// => false
print(Regexp("[0-9]+").matches(hello))
// => nil
print(Regexp("\\d+").delMatches("foo 123 bar"))
// => "foo  bar"
