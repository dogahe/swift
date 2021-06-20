//
//  main.swift
//  AccountsMerge
//
//  Created by Behzad Dogahe on 6/19/21.
//

/*
 
 721. Accounts Merge
 
 Given a list of accounts where each element accounts[i] is a list of strings, where the first element accounts[i][0] is a name, and the rest of the elements are emails representing emails of the account.

 Now, we would like to merge these accounts. Two accounts definitely belong to the same person if there is some common email to both accounts. Note that even if two accounts have the same name, they may belong to different people as people could have the same name. A person can have any number of accounts initially, but all of their accounts definitely have the same name.

 After merging the accounts, return the accounts in the following format: the first element of each account is the name, and the rest of the elements are emails in sorted order. The accounts themselves can be returned in any order.

 Example 1:
 Input: accounts = [["John","johnsmith@mail.com","john_newyork@mail.com"],["John","johnsmith@mail.com","john00@mail.com"],["Mary","mary@mail.com"],["John","johnnybravo@mail.com"]]
 Output: [["John","john00@mail.com","john_newyork@mail.com","johnsmith@mail.com"],["Mary","mary@mail.com"],["John","johnnybravo@mail.com"]]
 Explanation:
 The first and third John's are the same person as they have the common email "johnsmith@mail.com".
 The second John and Mary are different people as none of their email addresses are used by other accounts.
 We could return these lists in any order, for example the answer [['Mary', 'mary@mail.com'], ['John', 'johnnybravo@mail.com'],
 ['John', 'john00@mail.com', 'john_newyork@mail.com', 'johnsmith@mail.com']] would still be accepted.
 
 Example 2:
 Input: accounts = [["Gabe","Gabe0@m.co","Gabe3@m.co","Gabe1@m.co"],["Kevin","Kevin3@m.co","Kevin5@m.co","Kevin0@m.co"],["Ethan","Ethan5@m.co","Ethan4@m.co","Ethan0@m.co"],["Hanzo","Hanzo3@m.co","Hanzo1@m.co","Hanzo0@m.co"],["Fern","Fern5@m.co","Fern1@m.co","Fern0@m.co"]]
 Output: [["Ethan","Ethan0@m.co","Ethan4@m.co","Ethan5@m.co"],["Gabe","Gabe0@m.co","Gabe1@m.co","Gabe3@m.co"],["Hanzo","Hanzo0@m.co","Hanzo1@m.co","Hanzo3@m.co"],["Kevin","Kevin0@m.co","Kevin3@m.co","Kevin5@m.co"],["Fern","Fern0@m.co","Fern1@m.co","Fern5@m.co"]]
  
 Constraints:

 1 <= accounts.length <= 1000
 2 <= accounts[i].length <= 10
 1 <= accounts[i][j] <= 30
 accounts[i][0] consists of English letters.
 accounts[i][j] (for j > 0) is a valid email.
 
 */



func accountsMerge(_ accounts: [[String]]) -> [[String]] {
    var arr: [(String, Set<String>)] = []
    for account in accounts {
        let name = account[0]
        var emails = account
        emails.removeFirst()
        let emailsSet = Set(emails)
        arr.append((name, emailsSet))
        
        /*
        var wasAdded: Bool = false
        for i in 0 ..< arr.count {
            let element = arr[i]
            let emailsSet1 = element.1
            if !emailsSet.intersection(emailsSet1).isEmpty {
                arr[i].1 = emailsSet.union(emailsSet1)
                wasAdded = true
            }
        }
        if !wasAdded {
            arr.append((name, emailsSet))
        }
 */
    }
    
    var i = 0
    while i < arr.count - 1 {
        var j = i + 1
        while j < arr.count {
            let emailsSet1 = arr[i].1
            let emailsSet2 = arr[j].1
            if !emailsSet1.intersection(emailsSet2).isEmpty {
                arr[i].1 = emailsSet1.union(emailsSet2)
                arr.remove(at: j)
            } else {
               j += 1
            }
        }
        i += 1
    }
    
    print("***** \(arr)")
    
    
    var output: [[String]] = []
    for element in arr {
        let emails = Array(element.1).sorted()
        var account = [element.0]
        account.append(contentsOf: emails)
        output.append(account)
    }
    return output
}


let accounts1 = [["John","johnsmith@mail.com","john_newyork@mail.com"],["John","johnsmith@mail.com","john00@mail.com"],["Mary","mary@mail.com"],["John","johnnybravo@mail.com"]]
print(accountsMerge(accounts1))

print("--------------")
let accounts2 = [["Gabe","Gabe0@m.co","Gabe3@m.co","Gabe1@m.co"],["Kevin","Kevin3@m.co","Kevin5@m.co","Kevin0@m.co"],["Ethan","Ethan5@m.co","Ethan4@m.co","Ethan0@m.co"],["Hanzo","Hanzo3@m.co","Hanzo1@m.co","Hanzo0@m.co"],["Fern","Fern5@m.co","Fern1@m.co","Fern0@m.co"]]
print(accountsMerge(accounts2))

print("--------------")
let accounts3 =
[["David","David0@m.co","David1@m.co"],["David","David3@m.co","David4@m.co"],["David","David4@m.co","David5@m.co"],["David","David2@m.co","David3@m.co"],["David","David1@m.co","David2@m.co"]]

print(accountsMerge(accounts3))
