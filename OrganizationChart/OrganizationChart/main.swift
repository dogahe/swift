//
//  main.swift
//  OrganizationChart
//
//  Created by Behzad Dogahe on 6/7/21.
//

import Foundation


/*
 Given an org-chart denoted as a string in the following format:
 "id:name:manager_id,id:name:manager_id"
 Ex.
 "1:Max:4,2:Ann:0,3:Albert:2,4:Edmond:2"
 
 Print out an orgchart in simple ascii
 
 For the example above print out the following:
 
 Ann
 - Albert
 - Edmond
 -- Max
 */

/*
 Solution:
 
 Max (1) -> 4
 Ann (2) -> 0
 Albert (3) -> 2
 Edmond(4) -> 2
 
 1:Max:4,
 2:Ann:0,
 3:Albert:2,
 4:Edmond:2
 
 */

struct Employee {
    let id: Int
    let name: String
    let managerId: Int
    var reports: [Employee]?
}

func createOrg(_ str: String) {
    let employeeStrs: [String] = str.components(separatedBy: ",")
    var employees = employeeStrs.map( { parseEmployeeStr($0) })
    
    for i in 0 ..<  employees.count  {
        let employee = employees[i]
        let managerId = employee.managerId
        
        let managerIndex = employees.firstIndex(where: { $0.id == managerId } )
        if let managerIndex = managerIndex {
            let manager = employees[managerIndex]
            var reports = manager.reports
            if reports == nil {
                reports = []
            }
            reports!.append(employee)
            employees[managerIndex].reports = reports
        }
    }
    
    // for the top manager, the managerId is a value that does not belong to any employee but let's assume for now it's 0
    
    if let ceo = employees.filter( { $0.managerId == 0 } ).first {
        printChart(ceo)
    }
}

func parseEmployeeStr(_ str: String) -> Employee {
    let parts: [String] = str.components(separatedBy: ":")
    let id = Int(parts[0])!
    let name = parts[1]
    let managerId = Int(parts[2])!
    let employee = Employee(id: id, name: name, managerId: managerId)
    return employee
}


func printChart(_ ceo: Employee) {
    helper(ceo, 0)
}

func helper(_ employee: Employee?, _ level: Int) {
    if employee == nil {
        return
    }
    
    let prefixStr = String(repeating: "-", count: level)
    
    print("\(prefixStr) \(employee!.name)")
    if let reports = employee!.reports {
        for report in reports {
            helper(report, level + 1)
        }
    }
}

let str = "1:Max:4,2:Ann:0,3:Albert:2,4:Edmond:2"
createOrg(str)


