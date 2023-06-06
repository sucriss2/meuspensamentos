//
//  PlanManager.swift
//  meuspensamentos
//
//  Created by Suh on 10/05/23.
//

import Foundation

class PlanManager {

    let network: Network?
    private let manager = FileManager.default

    private var filePath: URL {
        let urlDirectories = manager.urls(for: .documentDirectory, in: .userDomainMask)
        return urlDirectories[0].appendingPathComponent("meusplanos.json")
    }

    init(network: Network = Network.shared) {
        self.network = network
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

    func fetchPlans(
        onComplete: @escaping ([Plan]) -> Void,
        onError: @escaping (Error) -> Void
    ) {

        let request = Request.init(
            baseURL: Config.baseURL,
            method: .get
        )

        network?.request(request: request, returning: [Plan].self,
                         onComplete: { result in
            switch result {
            case .failure(let error):
                onError(error)
            case .success(let plans):
                onComplete(plans ?? [])
            }
        })

    }

    func savePlansAfterLoad(plan: Plan) {
        fetchPlans { [self] plans in
            do {
                var plans = plans
                plans.append(plan)
                try savePlansArray(plans: plans, onComplete: { plans in

                }, onError: <#T##(Error) -> Void#>)
            } catch {
                print(error.localizedDescription)
            }
        } onError: { error in
            print(error.localizedDescription)
        }

    }

    func saveArrayPlans(plans: [Plan]) throws {
        let encoder = JSONEncoder()
        let plansData = try encoder.encode(plans)
        try plansData.write(to: filePath)
    }

    func savePlansArray(plans: [Plan], onComplete: @escaping ([Plan]) -> Void, onError: @escaping (Error) -> Void) {
        do {
            let encoder = JSONEncoder()
            let plansData = try encoder.encode(plans)

            let request = Request(baseURL: Config.baseURL, method: .post, body: plansData)

            network?.request(request: request, returning: [Plan].self, onComplete: { result in
                switch result {
                case .failure(let error):
                    onError(error)
                case .success(let plans):
                    guard let plans = plans else {
                        return
                    }
                    onComplete(plans)
                }
            })

        } catch {
            onError(error)
        }
    }

}
