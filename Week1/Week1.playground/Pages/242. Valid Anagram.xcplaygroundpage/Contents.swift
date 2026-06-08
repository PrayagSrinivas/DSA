//: [← Previous: 217. Contains Duplicate](@previous)
//:
//: # 242. Valid Anagram
//: [LeetCode](https://leetcode.com/problems/valid-anagram/)
//:
//: Given two strings `s` and `t`, return `true` if `t` is an anagram of `s`, and `false` otherwise.
//: An anagram is a word formed by rearranging the letters of another word, using all original letters exactly once.
//:
//: **Example 1:** Input: `s = "anagram"`, `t = "nagaram"` → Output: `true`
//: **Example 2:** Input: `s = "rat"`, `t = "car"` → Output: `false`

import Foundation

// MARK: - Solution

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        // Write your solution here
        return false
    }
}

// MARK: - Test Cases

let solution = Solution()

var passed = 0
var failed = [String]()

func check(_ result: Bool, _ expected: Bool, _ label: String) {
    if result == expected { passed += 1 }
    else { failed.append(label) }
}

check(solution.isAnagram("anagram",    "nagaram"),    true,  "TC01 - Classic anagram")
check(solution.isAnagram("rat",        "car"),        false, "TC02 - Not anagram")
check(solution.isAnagram("a",          "a"),          true,  "TC03 - Single char same")
check(solution.isAnagram("ab",         "a"),          false, "TC04 - Different lengths")
check(solution.isAnagram("",           ""),           true,  "TC05 - Both empty")
check(solution.isAnagram("listen",     "silent"),     true,  "TC06 - listen/silent")
check(solution.isAnagram("hello",      "world"),      false, "TC07 - No overlap")
check(solution.isAnagram("aacc",       "ccac"),       false, "TC08 - Same chars different count")
check(solution.isAnagram("aab",        "bba"),        false, "TC09 - Count mismatch")
check(solution.isAnagram("debitcard",  "badcredit"),  true,  "TC10 - Longer anagram")

if failed.isEmpty {
    print("All \(passed) test cases passed! ✅")
} else {
    print("⚠️ \(failed.count) test(s) failed: \(failed.joined(separator: ", "))")
}

//: [Next →](@next)
