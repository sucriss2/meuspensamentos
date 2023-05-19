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

    func preparePlan(model: Plan) {
        plan?.title = model.title
        plan?.text = model.text
        plan?.date = model.date

    }

    func savePlan(plan: Plan) { // transformar o json em dados e enviar pra salvar no arquivo bundle( json => dados)
        self.service?.savePlans(plan: plan)
    }

}

// model vai capturar as informacao do plan que vem da view e salvar no arquivo que esta no endereco do service.filepath
