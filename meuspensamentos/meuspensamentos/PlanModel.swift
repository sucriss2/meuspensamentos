//
//  PlanModel.swift
//  meuspensamentos
//
//  Created by Suh on 24/04/23.
//

import UIKit
import UserNotifications

protocol PlanModelDelegate: AnyObject {
    func didLoadSucess()
    func didError(message: String)
}

class PlanModel {
    private(set) var plans: [Plan]
    var service: PlanManager?
    weak var delegate: PlanModelDelegate?

    init() {
        plans = []
    }

    func load() {
        service?.loadPlans(
            onComplete: { [weak self] plans in
                guard let self = self else { return }
                self.plans = plans
                self.delegate?.didLoadSucess()
            },
            onError: { error in
                self.delegate?.didError(message: "\(error.localizedDescription)")
            }
        )

    }

    func setPlanDone(id: String) {
        if var plan = plans.first(where: {$0.id == id}) {
            plan.done = true
            plans.append(plan)
            savePlans()
        }
    }

    func deletePlan(index: Int) {
        UNUserNotificationCenter.current()
            .removePendingNotificationRequests(withIdentifiers: [plans[index].id])  // remover notificação
        plans.remove(at: index)
        savePlans()
    }

    private func savePlans() {
        do {
            try service?.saveArrayPlans(plans: plans)
        } catch {
            print(error.localizedDescription)
        }
    }

}
