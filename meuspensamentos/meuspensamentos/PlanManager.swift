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
        let URLDirectories = manager.urls(for: .documentationDirectory, in: .userDomainMask)
        return URLDirectories[0].appending(component: "plans.json")
    }

    init(plans: [Plan]) {
        self.plans = plans
    }

    func savePlans() {
        do {
            let encoder = JSONEncoder()
            let plansData = try encoder.encode(plans)
            if manager.createFile(atPath: filePath.path, contents: plansData, attributes: nil) {
                print("Falha ao salvar do Plano de Estudo")
            }
        } catch {
            print(error.localizedDescription)
        }
    }

    

}
