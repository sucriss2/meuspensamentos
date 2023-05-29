//
//  RegisterPlanViewController.swift
//  meuspensamentos
//
//  Created by Suh on 25/04/23.
//

import UIKit
import UserNotifications

class RegisterPlanViewController: UIViewController, UITextFieldDelegate {

    var screen: RegisterPlanView?
    var model: RegisterModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        view = screen
        title = "Cadastro"
        registerPlan()
    }

    func clearScreen() {
        guard let screen = screen else {
            return
        }
        screen.confirmButton.backgroundColor = .magenta
        screen.titleText = ""
        screen.subText = ""
        screen.isButtonEnabled = false

    }

    @objc private func addPlan() {
        guard let screen = screen else {
            return
        }
        let id = String(screen.datePlan.date.timeIntervalSince1970)

        if screen.titleText.isEmpty == false {
            let plan = Plan(title: screen.titleText, text: screen.subText, date: screen.dateString, id: id, done: false)
            model?.savePlan(plan)
        }

        let content = UNMutableNotificationContent()
        content.title = "Lembrete"
        content.subtitle = "Assunto \(screen.titleText)"
        content.body = "Estudar \(screen.subText)"
//        content.sound = UNNotificationSound(named: "arquivodesom.caf") // somente se o arquivo estiver no projeto.
        content.categoryIdentifier = "Lembrete"

//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 15, repeats: false)
        let dateComponent = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute],
            from: screen.datePlan.date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        clearScreen()
        screen.confirmButton.backgroundColor = .purple

    }

    func registerPlan() {
        screen?.confirmButton.addTarget(self, action: #selector(addPlan), for: .touchUpInside)
    }

}
