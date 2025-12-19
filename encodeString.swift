//
//  encodeString.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 3/15/25.
//

import Foundation

/*
extension String {
    subscript(_ i:Int) ->Character {
        let index = self.index(self.startIndex, offsetBy: i)
        return self[index]
    }
}
*/

func getDecodeOf(encodeString:String) -> String {
    return ""
    /*
    print(encodeString)
    var stack = Stack<Character>()
    
    for i in Range(0...encodeString.count-1) {
    
        if encodeString[i] != "]" {
            stack.push(encodeString[i])
        } else {
            var substr:String = ""
            while stack.peek() != "["  {
                guard let char = stack.pop(), char != nil else { break }
                substr = String(char) + substr
                
            }
            stack.pop()
            var digit:String = ""
            if !stack.isEmpty {
                var char = stack.peek()!
                while char.isNumber {
                    guard let number = stack.pop(), number != nil else { break }
                    digit = String(number) + digit
                    if !stack.isEmpty {
                        char = stack.peek()!
                    } else {
                        break
                    }
                }
            }
            
            guard let count = Int(digit) else { continue }
            let append = String(repeating: substr, count: count)
            stack.push(Array(append))
            
        }
    }
    
    return String(stack.storage)
     */
}

extension Character {
    
    func isCharNumber() -> Bool {
        return self.isNumber
    }
}
