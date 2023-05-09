//
//  RegisterModel.swift
//  meuspensamentos
//
//  Created by Suh on 02/05/23.
//

import UIKit

class RegisterModel {
    var plan: Plan?

    init() { 
    }

    func savePlan() {
        guard let fileURL = Bundle.main.url(forResource: "plans", withExtension: "json") else {
            return
        }

        let encoder = JSONEncoder()

        self.plan = Plan(title: plan?.title ?? "", text: plan?.text ?? "", date: plan?.date ?? "")
        do {
            let jsonData = try encoder.encode(plan)
            let string = String(data: jsonData, encoding: .utf8)
        } catch {
            print(error.localizedDescription)
        }
    }

}
