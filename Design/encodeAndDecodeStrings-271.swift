//
//  encodeAndDecodeStrings-271.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/22/25.
/*
 https://leetcode.com/problems/encode-and-decode-strings/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Design an algorithm to encode a list of strings to a string. The encoded string is then sent over the network and is decoded back to the original list of strings.

 Machine 1 (sender) has the function:

 string encode(vector<string> strs) {
   // ... your code
   return encoded_string;
 }
 Machine 2 (receiver) has the function:
 vector<string> decode(string s) {
   //... your code
   return strs;
 }
 So Machine 1 does:

 string encoded_string = encode(strs);
 and Machine 2 does:

 vector<string> strs2 = decode(encoded_string);
 strs2 in Machine 2 should be the same as strs in Machine 1.

 Implement the encode and decode methods.

 You are not allowed to solve the problem using any serialize methods (such as eval).

  

 Example 1:

 Input: dummy_input = ["Hello","World"]
 Output: ["Hello","World"]
 Explanation:
 Machine 1:
 Codec encoder = new Codec();
 String msg = encoder.encode(strs);
 Machine 1 ---msg---> Machine 2

 Machine 2:
 Codec decoder = new Codec();
 String[] strs = decoder.decode(msg);
 Example 2:

 Input: dummy_input = [""]
 Output: [""]
  

 Constraints:

 1 <= strs.length <= 200
 0 <= strs[i].length <= 200
 strs[i] contains any possible characters out of 256 valid ASCII characters.
 */

class Codec {
    static let separator = "1234567890+*-SALT-*+0987654321"
    func encode(_ strs: [String]) -> String {
        return strs.joined(separator:Self.separator)
    }
    
    func decode(_ s: String) -> [String] {
        return s.components(separatedBy: Self.separator)
        
    }
}
