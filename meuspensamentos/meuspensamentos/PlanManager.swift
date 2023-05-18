//
//  PlanManager.swift
//  meuspensamentos
//
//  Created by Suh on 10/05/23.
//

import Foundation

class PlanManager {

    var plans: [Plan] = []

    private let manager = FileManager.default

    private var filePath: URL {
        let urlDirectories = manager.urls(for: .documentDirectory, in: .userDomainMask)
        return urlDirectories[0].appendingPathComponent("meusplanos.json")
    }

//    init(plans: [Plan]) {
//        self.plans = plans
//    }

    init() {
        loadPlans()
    }

    func savePlans(plan: Plan) {
        do {
            plans.append(plan)
            let encoder = JSONEncoder()
            let plansData = try encoder.encode(plans)
            try plansData.write(to: filePath)
            print(filePath)
        } catch {
            print(error.localizedDescription)
        }
    }

    func loadPlans() {
        if manager.fileExists(atPath: filePath.path) {
            if let data = try? Data(contentsOf: filePath) {
                if let plans = try? JSONDecoder().decode([Plan].self, from: data) {
                    self.plans = plans
                }
            }
        }

    }

}
