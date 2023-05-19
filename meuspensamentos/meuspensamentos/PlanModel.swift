//
//  PlanModel.swift
//  meuspensamentos
//
//  Created by Suh on 24/04/23.
//

import UIKit

protocol PlanModelDelegate: AnyObject {
    func didLoadSucess()
    func didError(message: String)
}

class PlanModel {
    var plans: [Plan]
    var service: PlanManager?
    weak var delegate: PlanModelDelegate?

    init() {
        plans = []
    }

    func load() {
        guard let service = service else { return }
        if service.plans.isEmpty {
            self.delegate?.didError(message: "Lista vazia")
        } else {
            service.loadPlans()
            self.plans = service.plans
            self.delegate?.didLoadSucess()
        }

        print("====== AQUIIII ========")

//        service?.loadList(
//                   onComplete: { [weak self] plans in
//                       guard let self = self else { return }
//                       self.plans.append(contentsOf: plans)
//                       self.delegate?.didLoadSucess()
//                   },
//                   onError: { error in
//                       self.delegate?.didError(message: "\(error.localizedDescription)")
//                   })
    }

}
