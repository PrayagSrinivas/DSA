//: # 125. Valid Palindrome
//: [LeetCode](https://leetcode.com/problems/valid-palindrome/)
//:
//: A phrase is a palindrome if, after converting all uppercase letters into lowercase letters
//: and removing all non-alphanumeric characters, it reads the same forward and backward.
//: Alphanumeric characters include letters and numbers.
//:
//: **Example 1:** Input: `"A man, a plan, a canal: Panama"` → Output: `true`
//: **Example 2:** Input: `"race a car"` → Output: `false`
//: **Example 3:** Input: `" "` → Output: `true`

import Foundation

// MARK: - Solution

class Solution {
    func isPalindrome(_ s: String) -> Bool {
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

check(solution.isPalindrome("A man, a plan, a canal: Panama"), true,  "TC01 - Classic with punctuation")
check(solution.isPalindrome("race a car"),                     false, "TC02 - Not a palindrome")
check(solution.isPalindrome(" "),                              true,  "TC03 - Single space (empty after strip)")
check(solution.isPalindrome(""),                               true,  "TC04 - Empty string")
check(solution.isPalindrome("a"),                              true,  "TC05 - Single alphanumeric char")
check(solution.isPalindrome("Was it a car or a cat I saw?"),   true,  "TC06 - Sentence palindrome with punctuation")
check(solution.isPalindrome("0P"),                             false, "TC07 - Number and letter not palindrome")
check(solution.isPalindrome("A1a"),                            false, "TC08 - Mixed alpha-numeric not palindrome")
check(solution.isPalindrome("Never odd or even"),              true,  "TC09 - Classic word palindrome")
check(solution.isPalindrome("No 'x' in Nixon"),               true,  "TC10 - Palindrome with apostrophes and spaces")

if failed.isEmpty {
    print("All \(passed) test cases passed! ✅")
} else {
    print("⚠️ \(failed.count) test(s) failed: \(failed.joined(separator: ", "))")
}

//: [Next →](@next)
