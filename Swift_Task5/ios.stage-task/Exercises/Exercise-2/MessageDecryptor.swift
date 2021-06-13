import UIKit

class MessageDecryptor: NSObject {
    
    func decryptMessage(_ message: String) -> String {
    
        var messageCopy = message
        let numberCharacters = NSCharacterSet.decimalDigits
        let pattern = "(\\d+\\[[a-z]+\\])"
        
        // if string doesn't contain digits
        if (messageCopy.rangeOfCharacter(from: numberCharacters) == nil) {
            messageCopy = messageCopy.replacingOccurrences(of: "[", with: "")
            messageCopy = messageCopy.replacingOccurrences(of: "]", with: "")
        }
        
        // if string contains digits
        while (messageCopy.rangeOfCharacter(from: numberCharacters) != nil) {
            if let range = messageCopy.range(of: pattern, options: .regularExpression) {
                var tmpSubstring = String(messageCopy[range])
                
                tmpSubstring = tmpSubstring.replacingOccurrences(of: "]", with: "")
                let tmpArr = tmpSubstring.components(separatedBy: "[")
                
                var resultSubstring = ""
                let count = Int(tmpArr[0])!
                
                if count == 0 {
                    resultSubstring.append("")
                }
                else {
                    for _ in 0...count-1 {
                        resultSubstring.append(tmpArr[1])
                    }
                }
                messageCopy.replaceSubrange(range, with: resultSubstring)
            }
        }
       
        if messageCopy.contains("[") {
            messageCopy = messageCopy.replacingOccurrences(of: "]", with: "")
            messageCopy = messageCopy.replacingOccurrences(of: "[", with: "")
        }
        
        return messageCopy
    }
}

