//
//  PlanModel.swift
//  meuspensamentos
//
//  Created by Suh on 24/04/23.
//

import UIKit

class PlanModel {
    var plans: [Plan]
    var service: PlanManager?

    init() {
        plans = []
    }

    func load() {
        print("====== AQUIIII ========")
//        service?.loadList(
//                   onComplete: { [weak self] cars in
//                       guard let self = self else { return }
//                       self.cars.append(contentsOf: cars)
//                       self.delegate?.didLoadSucess()
//                   },
//                   onError: { error in
//                       self.delegate?.didError(message: "\(error.localizedDescription)")
//                   })
    }

}
