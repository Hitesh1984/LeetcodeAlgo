//
//  DefangingAnIPAddress-1108.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 7/23/25.
/*
 https://leetcode.com/problems/defanging-an-ip-address/description/?envType=company&envId=yahoo&favoriteSlug=yahoo-more-than-six-months
 
 Given a valid (IPv4) IP address, return a defanged version of that IP address.

 A defanged IP address replaces every period "." with "[.]".

  

 Example 1:

 Input: address = "1.1.1.1"
 Output: "1[.]1[.]1[.]1"
 Example 2:

 Input: address = "255.100.50.0"
 Output: "255[.]100[.]50[.]0"
  

 Constraints:

 The given address is a valid IPv4 address.

 */

func defangIPaddr(_ input: String) -> String {
    var stringExample = ""
    for char in input{
        if char == "."{
            stringExample.append("[.]")
        }else{
            stringExample.append(char)
        }
    }
    return stringExample
}
