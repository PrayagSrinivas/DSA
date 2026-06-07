/*:
 [Previous](@previous) | [Next](@next)
 
 # 205. Isomorphic Strings
 
 [LeetCode Problem Link](https://leetcode.com/problems/isomorphic-strings/)
 
 ## Problem Description
 
 Given two strings `s` and `t`, determine if they are isomorphic.
 
 Two strings `s` and `t` are **isomorphic** if the characters in `s` can be replaced to get `t`.
 
 All occurrences of a character must be replaced with another character while **preserving the order of characters**. No two characters may map to the same character, but a character may map to itself.
 
 ---
 
 ## Examples
 
 **Example 1:**
 ```
 Input: s = "egg", t = "add"
 Output: true
 Explanation: The strings are isomorphic because:
 - 'e' maps to 'a'
 - 'g' maps to 'd'
 ```
 
 **Example 2:**
 ```
 Input: s = "foo", t = "bar"
 Output: false
 Explanation: The strings are not isomorphic because:
 - 'o' cannot map to both 'o' and 'r'
 ```
 
 **Example 3:**
 ```
 Input: s = "paper", t = "title"
 Output: true
 Explanation: The strings are isomorphic because:
 - 'p' maps to 't'
 - 'a' maps to 'i'
 - 'e' maps to 'l'
 - 'r' maps to 'e'
 ```
 
 ---
 
 ## Constraints
 
 - `1 <= s.length <= 5 * 10^4`
 - `t.length == s.length`
 - `s` and `t` consist of any valid ASCII character.
 
 ---
 
 ## Hints
 
 💡 **Hint 1:** You need to maintain two mappings - one from characters in `s` to characters in `t`, and another from characters in `t` to characters in `s`.
 
 💡 **Hint 2:** Use hash maps to store the character mappings and check if the mapping is consistent throughout the strings.
 
 💡 **Hint 3:** Make sure to check both directions - a character in `s` maps to exactly one character in `t`, AND a character in `t` maps to exactly one character in `s`.
 
 ---
 */

import Foundation

// MARK: - Solution

func isIsomorphic(_ s: String, _ t: String) -> Bool {
    
    var hashMap: [Character : Character] = [:]
    
    var firstArray = Array(s)
    var secondArray = Array(t)
    var claimedLetters = Set<Character>()
    
    // Add safety check first.
    guard firstArray.count == secondArray.count else { return false }
    
    for i in 0..<firstArray.count {
        
        // Extract current index charactr of both string.
        let charS = firstArray[i]
        let charT = secondArray[i]
        
        if let item = hashMap[firstArray[i]] {
            // Check for the mapped character.
            if item != secondArray[i] {
                return false
            }
        } else {
            // Check for the unique charactr so that so two key map to same key.
            if claimedLetters.contains(secondArray[i]) { return false }
            
            hashMap[firstArray[i]] = secondArray[i]
            claimedLetters.insert(secondArray[i])
        }
    }
    return true
}

// MARK: - Test Cases

print("Running test cases for Isomorphic Strings...\n")

// Test 1: Basic isomorphic strings
let result1 = isIsomorphic("egg", "add")
print("Test 1: s = \"egg\", t = \"add\"")
print("Expected: true")
print("Got: \(result1)")
print("Result: \(result1 == true ? "✅ PASS" : "❌ FAIL")\n")

// Test 2: Not isomorphic - character mapping conflict
let result2 = isIsomorphic("foo", "bar")
print("Test 2: s = \"foo\", t = \"bar\"")
print("Expected: false")
print("Got: \(result2)")
print("Result: \(result2 == false ? "✅ PASS" : "❌ FAIL")\n")

// Test 3: Isomorphic with multiple characters
let result3 = isIsomorphic("paper", "title")
print("Test 3: s = \"paper\", t = \"title\"")
print("Expected: true")
print("Got: \(result3)")
print("Result: \(result3 == true ? "✅ PASS" : "❌ FAIL")\n")

// Test 4: Not isomorphic - two characters map to same character
let result4 = isIsomorphic("badc", "baba")
print("Test 4: s = \"badc\", t = \"baba\"")
print("Expected: false")
print("Got: \(result4)")
print("Result: \(result4 == false ? "✅ PASS" : "❌ FAIL")\n")

// Test 5: Single character
let result5 = isIsomorphic("a", "a")
print("Test 5: s = \"a\", t = \"a\"")
print("Expected: true")
print("Got: \(result5)")
print("Result: \(result5 == true ? "✅ PASS" : "❌ FAIL")\n")

// Test 6: All same characters
let result6 = isIsomorphic("aaa", "bbb")
print("Test 6: s = \"aaa\", t = \"bbb\"")
print("Expected: true")
print("Got: \(result6)")
print("Result: \(result6 == true ? "✅ PASS" : "❌ FAIL")\n")

// Test 7: Complex case
let result7 = isIsomorphic("abcdefghijklmnopqrstuvwxyz", "zyxwvutsrqponmlkjihgfedcba")
print("Test 7: s = \"abcdefghijklmnopqrstuvwxyz\", t = \"zyxwvutsrqponmlkjihgfedcba\"")
print("Expected: true")
print("Got: \(result7)")
print("Result: \(result7 == true ? "✅ PASS" : "❌ FAIL")\n")

// Final check
let allPassed = result1 == true && result2 == false && result3 == true && 
                result4 == false && result5 == true && result6 == true && result7 == true

if allPassed {
    print("All test cases passed! ✅")
} else {
    print("Some test cases failed! ❌")
}

//: [Previous](@previous) | [Next](@next)
