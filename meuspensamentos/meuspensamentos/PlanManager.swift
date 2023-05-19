//
//  PlanManager.swift
//  meuspensamentos
//
//  Created by Suh on 10/05/23.
//

import Foundation

class PlanManager {

    private let manager = FileManager.default

    private var filePath: URL {
        let urlDirectories = manager.urls(for: .documentDirectory, in: .userDomainMask)
        return urlDirectories[0].appendingPathComponent("meusplanos.json")
    }

    init() {
    }

    func loadPlans(
        onComplete: @escaping ([Plan]) -> Void,
        onError: @escaping (Error) -> Void
    ) {

        let error = NSError(domain: "Erro no Servidor", code: 123)

        guard manager.fileExists(atPath: filePath.path) else {
            onComplete([])
            return
        }
        guard let data = try? Data(contentsOf: filePath) else {
            onError(error)
            return
        }
        guard let plans = try? JSONDecoder().decode([Plan].self, from: data) else {
            onError(error)
            return
        }
        onComplete(plans)

    }

    func savePlans(plan: Plan) {
        loadPlans { [self] plans in
            do {
                var plans = plans
                plans.append(plan)
                let encoder = JSONEncoder()
                let plansData = try encoder.encode(plans)
                try plansData.write(to: filePath)
                print(filePath)
            } catch {
                print(error.localizedDescription)
            }
        } onError: { error in
            print(error.localizedDescription)
        }

    }

}
