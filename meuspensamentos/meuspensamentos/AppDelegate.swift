//
//  AppDelegate.swift
//  meuspensamentos
//
//  Created by Suh on 17/04/23.
// swiftlint:disable line_length

import UIKit
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let center = UNUserNotificationCenter.current()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navigationBarApperence = UINavigationBar.appearance()
        navigationBarApperence.tintColor = .magenta
        navigationBarApperence.preservesSuperviewLayoutMargins = true
        navigationBarApperence.prefersLargeTitles = true

        center.delegate = self
        center.getNotificationSettings { (settings) in
            if settings.authorizationStatus == .notDetermined {
                let options: UNAuthorizationOptions = [.alert, .sound, .badge, .carPlay]
                self.center.requestAuthorization(options: options) { sucess, error in
                    if error == nil {
                        print(sucess)
                    } else {
                        print(error!.localizedDescription)
                    }
                }

            } else if settings.authorizationStatus == .denied {
                print("Usuário negou a Notificação")
                // alerta para autorizar, retornando a tela de setting.
            }
        }

        let confirmAction = UNNotificationAction(identifier: "Confirm", title: "Feito 👍", options: [.foreground])
        let cancelAction = UNNotificationAction(identifier: "Cancel", title: "Cancelar", options: [])
        let category = UNNotificationCategory(identifier: "Lembrete", actions: [confirmAction, cancelAction], intentIdentifiers: [], options: [.customDismissAction])
        center.setNotificationCategories([category])

        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // disparado a notificação enquanto o app está aberto, nesmo com o usuario dentro do app.
        completionHandler([.list, .banner, .sound])

    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        // disparado quando o usuario recebeu a notificacao, da pra verificar qual acao foi escolhida, e o dev tomar a decisao em relacao. Tenho acesso a todas as informacoes da notificacao.
        let id = response.notification.request.identifier
        print(id)

        switch response.actionIdentifier {
        case "Confirm":
            print("Usuário confirmou que o plano foi realizado")
        case "Cancel":
            print("Usuário cancelou")
        case UNNotificationDefaultActionIdentifier:
            print("Tocou na própria notificação")
        case UNNotificationDismissActionIdentifier:
            print("Dismiss na notificação")
        default:
            break
        }

        completionHandler()
    }
}
