//: [← Previous: 167. Two Sum II](@previous)
//:
//: # 128. Longest Consecutive Sequence
//: [LeetCode](https://leetcode.com/problems/longest-consecutive-sequence/)
//:
//: Given an unsorted array of integers `nums`, return the length of the longest consecutive elements sequence.
//: You must write an algorithm that runs in **O(n)** time.
//:
//: **Example 1:** Input: `[100,4,200,1,3,2]` → Output: `4` (sequence: `1,2,3,4`)
//: **Example 2:** Input: `[0,3,7,2,5,8,4,6,0,1]` → Output: `9` (sequence: `0,1,2,3,4,5,6,7,8`)
//: **Example 3:** Input: `[]` → Output: `0`

import Foundation

// MARK: - Solution

class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        // Write your solution here
        return 0
    }
}

// MARK: - Test Cases

let solution = Solution()

var passed = 0
var failed = [String]()

func check(_ result: Int, _ expected: Int, _ label: String) {
    if result == expected { passed += 1 }
    else { failed.append("\(label) (got \(result), expected \(expected))") }
}

check(solution.longestConsecutive([100, 4, 200, 1, 3, 2]),       4, "TC01 - Basic example")
check(solution.longestConsecutive([0, 3, 7, 2, 5, 8, 4, 6, 0, 1]), 9, "TC02 - Duplicate with long seq")
check(solution.longestConsecutive([]),                             0, "TC03 - Empty array")
check(solution.longestConsecutive([1]),                            1, "TC04 - Single element")
check(solution.longestConsecutive([1, 2, 3, 4, 5]),               5, "TC05 - Already consecutive")
check(solution.longestConsecutive([5, 4, 3, 2, 1]),               5, "TC06 - Reverse order")
check(solution.longestConsecutive([1, 3, 5, 7]),                  1, "TC07 - No consecutive, all isolated")
check(solution.longestConsecutive([1, 2, 0, 1]),                  3, "TC08 - Duplicates in sequence")
check(solution.longestConsecutive([-3, -2, -1, 0, 1]),            5, "TC09 - Negative to positive sequence")
check(solution.longestConsecutive([9, 1, 4, 7, 3, -1, 0, 5, 8, -1, 6]), 7, "TC10 - Mixed with negatives, len 7: -1,0,1 and 3,4,5,6,7,8,9")

if failed.isEmpty {
    print("All \(passed) test cases passed! ✅")
} else {
    print("⚠️ \(failed.count) test(s) failed: \(failed.joined(separator: ", "))")
}

//: [Next →](@next)
