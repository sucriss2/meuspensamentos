//
//  Plan.swift
//  meuspensamentos
//
//  Created by Suh on 24/04/23.
// swiftlint:disable line_length

import Foundation

struct Plan: Codable {
    var title: String
    var text: String
    var date: String
    var id: String
    var done: Bool

    init(title: String, text: String, date: String, id: String, done: Bool) {
        self.title = title
        self.text = text
        self.date = date
        self.id = id
        self.done = done
    }

}

// extension Plan {
//    static func fixture(
//        title: String = "Titulo do Lembrete",
//        text: String = "Mensagem do lembrete completa com todos os detalhes posiveis e imaginaveis, sera que cabem mais ate a terceira linha???????",
//        date: String = "10-03-23",
//        id: String = "",
//        done: Bool = false
//    ) -> Plan {
//        Plan(
//            title: title,
//            text: text,
//            date: date,
//            id: id,
//            done: done
//        )
//
//    }
//
// }
