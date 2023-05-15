//
//  PlanManager.swift
//  meuspensamentos
//
//  Created by Suh on 10/05/23.
//

import Foundation

class PlanManager {

    let plan: Plan?

    init() {
        self.plan = Plan(title: "", text: "", date: "")
    }

    func loadJson(plan: Plan) {
        let decoder = JSONDecoder()
        guard
            let url = Bundle.main.url(forResource: "plans", withExtension: "json"),
            let data = try? Data(contentsOf: url)
        else { return }
        do {
            let plan = try? decoder.decode(Plan.self, from: data)
        }

        print(plan.title)
    }

    func savePlans() {
        
    }


}

//        guard let fileURL = Bundle.main.url(forResource: "plans", withExtension: "json") else { return }
//        do {
//            let jsonData = try Data(contentsOf: fileURL)
//            let jsonDecoder = JSONDecoder()
//            do {
//                plan = try jsonDecoder.decode(Plan.self, from: jsonData)
//            }
//        } catch {
//            error.localizedDescription
//        }

//    }

//    func loadPlans(
//        onComplete: @escaping (Plan) -> Void,
//        onError: @escaping (Error) -> Void
//    ) {
//        guard let fileURL = Bundle.main.url(forResource: "plans", withExtension: "json") else { return }
//        do {
//            let jsonData = try Data(contentsOf: fileURL)
//            let jsonDecoder = JSONDecoder()
//            do {
//                self.plan = try jsonDecoder.decode(Plan.self, from: jsonData)
//            }
//        } catch {
//            onError(error)
//        }
//
//    }
//
//    func savePlan() {
//        if let data = try? JSONEncoder().encode(plans) {
//            Bundle.main.
//        }
//    }

// struct Person : Codable {
//    let name: String
//    let lastName: String
//    let age: Int
// }
//
// func loadJson(fileName: String) -> Person? {
//   let decoder = JSONDecoder()
//   guard
//        let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
//        let data = try? Data(contentsOf: url),
//        let person = try? decoder.decode(Person.self, from: data)
//   else {
//        return nil
//   }
//
//   return person
// }

// MARK: ENCODER

// if let data = try? JSONEncoder().encode(plan) {
//    let objectString = String(data: data, encoding: .utf8)
// }
