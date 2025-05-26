//
//  ValidParanthesis-20.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/19/25.
//

import Foundation

func isValid(_ s: String) -> Bool {
    
    guard s.count % 2 == 0 else { return false }
    var stack = [Character]()
    for ch in s {
        switch ch {
            case "(" : stack.append(")")
            case "[" : stack.append("]")
            case "{" : stack.append("}")
            default:
                if stack.isEmpty || stack.removeLast() != ch {
                    return false
                }
        }
    }
    return stack.isEmpty
}
