//
//  CountAndSay-38.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 8/18/25.
/*
 https://leetcode.com/problems/count-and-say/description/?envType=company&envId=paypal&favoriteSlug=paypal-more-than-six-months
 
 
 */

import Foundation


func countAndSay(_ n: Int) -> String {
    var RLE = "1" // base case
    
    for _ in 1..<n {
        var nextRLE = ""
        var counter = 0
        var prevChar: Character?
        
        for char in RLE {
            if prevChar == nil {
                counter += 1
                prevChar = char
            } else if prevChar == char {
                counter += 1
            } else {
                nextRLE += "\(counter)\(prevChar!)"
                prevChar = char
                counter = 1
            }
        }
        
        if counter > 0 {
            nextRLE += "\(counter)\(prevChar!)"
        }
        
        RLE = nextRLE
    }
    
    return RLE
}
