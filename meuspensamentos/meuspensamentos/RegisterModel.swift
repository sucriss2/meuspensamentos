//
//  RegisterModel.swift
//  meuspensamentos
//
//  Created by Suh on 02/05/23.
//

import UIKit

class RegisterModel {
    var plan: Plan?
    var service: PlanManager?

    init() {
    }

    func savePlan(plan: Plan) { // transformar o json em dados e enviar pra salvar no arquivo bundle( json => dados)
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(plan)
            let jsonString = String(data: jsonData, encoding: .utf8)
            Swift.print("JSON String : " + jsonString!)
        } catch {
            print(error.localizedDescription)
        }

        self.service?.loadJson(plan: plan)
        print("Salvo este plano a baixo.... ")

    }

}
