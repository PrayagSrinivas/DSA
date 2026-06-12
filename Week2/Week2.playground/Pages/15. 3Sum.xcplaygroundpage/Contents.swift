//: [← Previous: 128. Longest Consecutive Sequence](@previous)
//:
//: # 15. 3Sum
//: [LeetCode](https://leetcode.com/problems/3sum/)
//:
//: Given an integer array `nums`, return all the triplets `[nums[i], nums[j], nums[k]]` such that
//: `i != j`, `i != k`, `j != k`, and `nums[i] + nums[j] + nums[k] == 0`.
//: The solution set must **not contain duplicate triplets**.
//:
//: **Example 1:** Input: `[-1,0,1,2,-1,-4]` → Output: `[[-1,-1,2],[-1,0,1]]`
//: **Example 2:** Input: `[0,1,1]` → Output: `[]`
//: **Example 3:** Input: `[0,0,0]` → Output: `[[0,0,0]]`

import Foundation

// MARK: - Solution

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        // Write your solution here
        return []
    }
}

// MARK: - Test Cases

let solution = Solution()

// Helper: sort inner arrays and outer array for order-independent comparison
func normalize(_ input: [[Int]]) -> [[Int]] {
    input.map { $0.sorted() }.sorted { $0.lexicographicallyPrecedes($1) }
}

var passed = 0
var failed = [String]()

func check(_ result: [[Int]], _ expected: [[Int]], _ label: String) {
    if normalize(result) == normalize(expected) { passed += 1 }
    else { failed.append("\(label) (got \(normalize(result)), expected \(normalize(expected)))") }
}

check(solution.threeSum([-1, 0, 1, 2, -1, -4]),         [[-1, -1, 2], [-1, 0, 1]], "TC01 - Basic example")
check(solution.threeSum([0, 1, 1]),                       [],                        "TC02 - No valid triplet")
check(solution.threeSum([0, 0, 0]),                       [[0, 0, 0]],               "TC03 - All zeros")
check(solution.threeSum([]),                              [],                        "TC04 - Empty array")
check(solution.threeSum([0]),                             [],                        "TC05 - Single element")
check(solution.threeSum([0, 0]),                          [],                        "TC06 - Two elements")
check(solution.threeSum([-2, 0, 1, 1, 2]),               [[-2, 0, 2], [-2, 1, 1]], "TC07 - Multiple triplets")
check(solution.threeSum([-4, -1, -1, 0, 1, 2]),          [[-1, -1, 2], [-1, 0, 1]], "TC08 - Duplicates in input")
check(solution.threeSum([1, 2, -2, -1]),                  [],                        "TC09 - No zero-sum triplet")
check(solution.threeSum([-2, -1, 0, 1, 2, -1, -4, 3]),  [[-4, 1, 3], [-2, -1, 3], [-2, 0, 2], [-1, -1, 2], [-1, 0, 1]], "TC10 - Larger input, multiple triplets")

if failed.isEmpty {
    print("All \(passed) test cases passed! ✅")
} else {
    print("⚠️ \(failed.count) test(s) failed:")
    failed.forEach { print("  • \($0)") }
}

//: [Next →](@next)
