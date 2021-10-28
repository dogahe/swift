/*
 
 tags:Facebook
 
 topic:Sorting
 
 Counting Triangles
 
 Given a list of N triangles with integer side lengths, determine how many different triangles there are. Two triangles are considered to be the same if they can both be placed on the plane such that their vertices occupy exactly the same three points.
 Signature
 int countDistinctTriangles(ArrayList<Sides> arr)
 or
 int countDistinctTrianges(int[][] arr)
 Input
 In some languages, arr is an Nx3 array where arr[i] is a length-3 array that contains the side lengths of the ith triangle. In other languages, arr is a list of structs/objects that each represent a single triangle with side lengths a, b, and c.
 It's guaranteed that all triplets of side lengths represent real triangles.
 All side lengths are in the range [1, 1,000,000,000]
 1 <= N <= 1,000,000
 Output
 Return the number of distinct triangles in the list.
 Example 1
 arr = [[2, 2, 3], [3, 2, 2], [2, 5, 6]]
 output = 2
 The first two triangles are the same, so there are only 2 distinct triangles.
 Example 2
 arr = [[8, 4, 6], [100, 101, 102], [84, 93, 173]]
 output = 3
 All of these triangles are distinct.
 Example 3
 arr = [[5, 8, 9], [5, 9, 8], [9, 5, 8], [9, 8, 5], [8, 9, 5], [8, 5, 9]]
 output = 1
 All of these triangles are the same.
 
 */

func countDistinctTriangles(arr: [[Int]]) -> Int {
  // Write your code here
  return 0;
}

import math
# Add any extra import statements you may need here


# Add any helper functions you may need here


def countDistinctTriangles(arr):
  # Write your code here
  












# These are the tests we use to determine if the solution is correct.
# You can add your own at the bottom.

def printInteger(n):
  print('[', n, ']', sep='', end='')

test_case_number = 1

def check(expected, output):
  global test_case_number
  result = False
  if expected == output:
    result = True
  rightTick = '\u2713'
  wrongTick = '\u2717'
  if result:
    print(rightTick, 'Test #', test_case_number, sep='')
  else:
    print(wrongTick, 'Test #', test_case_number, ': Expected ', sep='', end='')
    printInteger(expected)
    print(' Your output: ', end='')
    printInteger(output)
    print()
  test_case_number += 1

if __name__ == "__main__":
  arr_1 = [(7, 6, 5), (5, 7, 6), (8, 2, 9), (2, 3, 4), (2, 4, 3)]
  expected_1 = 3
  output_1 = countDistinctTriangles(arr_1)
  check(expected_1, output_1)

  arr_2 = [(3, 4, 5), (8, 8, 9), (7, 7, 7)]
  expected_2 = 3
  output_2 = countDistinctTriangles(arr_2)
  check(expected_2, output_2)

  # Add your own test cases here
                                                
                                                
                                                
                                                import java.io.*;
                                                import java.util.*;
                                                // Add any extra import statements you may need here


                                                class Main {

                                                  class Sides{
                                                    int a;
                                                    int b;
                                                    int c;
                                                    Sides(int a,int b,int c){
                                                      this.a = a;
                                                      this.b = b;
                                                      this.c = c;
                                                    }
                                                  }
                                                  
                                                  // Add any helper functions you may need here
                                                  
                                                  
                                                  int countDistinctTriangles(ArrayList<Sides> arr) {
                                                    // Write your code here
                                                    
                                                  }













                                                  // These are the tests we use to determine if the solution is correct.
                                                  // You can add your own at the bottom.
                                                  int test_case_number = 1;
                                                  
                                                  void check(int expected, int output) {
                                                    boolean result = (expected == output);
                                                    char rightTick = '\u2713';
                                                    char wrongTick = '\u2717';
                                                    if (result) {
                                                      System.out.println(rightTick + " Test #" + test_case_number);
                                                    }
                                                    else {
                                                      System.out.print(wrongTick + " Test #" + test_case_number + ": Expected ");
                                                      printInteger(expected);
                                                      System.out.print(" Your output: ");
                                                      printInteger(output);
                                                      System.out.println();
                                                    }
                                                    test_case_number++;
                                                  }
                                                  
                                                  void printInteger(int n) {
                                                    System.out.print("[" + n + "]");
                                                  }
                                                  
                                                  public void run() {
                                                    ArrayList<Sides> arr_1 = new ArrayList<>();
                                                    arr_1.add(new Sides(7, 6, 5));
                                                    arr_1.add(new Sides(5, 7, 6));
                                                    arr_1.add(new Sides(8, 2, 9));
                                                    arr_1.add(new Sides(2, 3, 4));
                                                    arr_1.add(new Sides(2, 4, 3));
                                                    int expected_1 = 3;
                                                    int output_1 = countDistinctTriangles(arr_1);
                                                    check(expected_1, output_1);

                                                    ArrayList<Sides> arr_2 = new ArrayList<>();
                                                    arr_2.add(new Sides(3, 4, 5));
                                                    arr_2.add(new Sides(8, 8, 9));
                                                    arr_2.add(new Sides(7, 7, 7));
                                                    int expected_2 = 3;
                                                    int output_2 = countDistinctTriangles(arr_2);
                                                    check(expected_2, output_2);
                                                    
                                                    // Add your own test cases here
                                                    
                                                  }
                                                  
                                                  public static void main(String[] args) {
                                                    new Main().run();
                                                  }
                                                }
