//: A UIKit based Playground for presenting user interface
  
//import UIKit
//import PlaygroundSupport
//
//class MyViewController : UIViewController {
//    override func loadView() {
//        let view = UIView()
//        view.backgroundColor = .white
//
//        let label = UILabel()
//        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
//        label.text = "Hello World!"
//        label.textColor = .black
//
//        view.addSubview(label)
//        self.view = view
//    }
//}
//// Present the view controller in the Live View window
//PlaygroundPage.current.liveView = MyViewController()


import Foundation

let remindersDataURL = URL(
    fileURLWithPath: "Reminders",
    relativeTo: FileManager.documentDirectoryURL)

let stringURL = FileManager.documentDirectoryURL
    .appendingPathComponent("String")
    .appendingPathExtension("txt")

stringURL.path

let challengeString: String = "To Do List"
let challengeURL: URL = URL(
    fileURLWithPath: challengeString,
    relativeTo: FileManager.documentDirectoryURL)
    .appendingPathExtension("txt")

challengeURL.lastPathComponent


let favoriteBytes: [UInt8] = [
    240,        159,       152,        184,
    240,        159,       152,        185,
    0b1111_0000, 0b1001_1111, 0b1001_1000, 186,
    0xF0,       0x9F,       0x98,       187
]

MemoryLayout<UInt8>.size * favoriteBytes.count


// SAVING & LOADING DATT

let favoriteBytesData = Data(favoriteBytes)
let favoriteBytesURL = URL(fileURLWithPath: "Favorite Bytes", relativeTo: FileManager.documentDirectoryURL)
try favoriteBytesData.write(to: favoriteBytesURL)
let savedFavoriteBytesData = try Data(contentsOf: favoriteBytesURL)
let savedFavoriteBytes = Array(savedFavoriteBytesData)

favoriteBytes == savedFavoriteBytes
favoriteBytesData == savedFavoriteBytesData


// STRING

try favoriteBytesData.write(to: favoriteBytesURL.appendingPathExtension("json"))
let string = String(data: savedFavoriteBytesData, encoding: .utf8)!
 print(favoriteBytesData)
print(favoriteBytes)
// Challenge-String Data #2 desafio

let catsURL = URL(fileURLWithPath: "Cats.json", relativeTo: FileManager.documentDirectoryURL)
try string.write(to: catsURL, atomically: true, encoding: .utf8)
let catsChallengeString = try String(contentsOf: catsURL)

