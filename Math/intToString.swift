//
//  intToString.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/20/25.
//

import Foundation

func getStringOf(_ num:inout Int) -> String
{
    var s = ""
    while num > 0 {
     
        let rem = num % 10
        num/=10
        s = String(rem) + s
    }
    return s
}

func getStringOf(_ num:inout Int) -> [Character]
{
    var s = [Character]()
    while num > 0 {
     
        let rem = num % 10
        num/=10
        s = String(rem) + s
    }
    return s
}

