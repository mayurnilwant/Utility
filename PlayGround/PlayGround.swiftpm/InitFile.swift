//
//  File.swift
//  PlayGround
//
//  Created by Mayur Nilwant on 24/01/2023.
//

import Foundation
import UIKit




//

struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}


struct Rect {
    var origin = Point()
    var size = Size()
     init() {}
 
}

extension Rect {
    
    init(origin: Point, size: Size) {
        self.init()
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        self.init()
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}





struct faranite {
    
    var temparature: Double
    
    init () {
        
        temparature = 32.0
    }
}

struct Celsius {
    
    var temperatureInCelsius: Double
    
    
    init(fromFaranite faranite: Double) {
        self.temperatureInCelsius = (faranite - 32.0) * 1.8
    }
    
    init(fromKelvin kelvin: Double) {
        self.temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        self.temperatureInCelsius = celsius
    }
}

struct Person {
    
    let firstName: String?
    let lastName: String?
    let age: Int
    
    
    init?(withFirstName fName: String, andLastName lName: String, andAge age: Int) {
        
        
        guard !fName.isEmpty else {
            return nil 
        }
        self.firstName = fName
        self.lastName = lName
        self.age = age
        
    }
}


//Use of Optionals in practical life

struct SurveyQuestion {
    
    let question: String
    var answer: String?
    
    init(withQuestion question: String) {
        self.question = question
    }
}


enum TemperatureInUnit: Character {
    
    case kelvin = "K"
    case celsiuc = "C"
    case Faranite = "F"
}


let temp = TemperatureInUnit(rawValue: "R")



enum MachineError : Error {
    
    case insuffecientBalance(coinsNeeded: Int)
    case invalidInput
    case outOfService
    
}


let machineError = MachineError.insuffecientBalance(coinsNeeded: 20)


struct VendDrinks {
    
    func vendDrinks() async -> Bool {
        
            false
    }
}

struct VendingMachine {
    
    let outOfservice : Bool = false
    let balance: Int?
    func vend() async   {
        

        
    }
}



protocol FullName {
    
    var fullName: String {get set}
    mutating func setFatherName() -> String
     init(withDefaultFullName fullName: String)
    
}


struct Pupil: FullName {
    init(withDefaultFullName fullName: String) {
        self.fullName = ""
        self.fName = ""
        self.lName = ""
        self.school = ""
    }
    
    mutating func setFatherName() -> String {
        return "Father namne"
    }
    

    var fullName: String
    var fName: String
    var lName: String
    private var school: String
    
    
    
}


extension Pupil {
    func makeReportCard() {
        print(self.school)
        
    }
}

//
class Student : FullName {
    required init(withDefaultFullName fullName: String) {
        self.fullName = ""

    }
    
    func setFatherName() -> String {
        "father Name"
    }

    var fullName: String = ""

}


protocol DropDownDelegate:AnyObject {
    
    func didSelectDropDown(withValue value: String)
}

class DropDown {
    weak var delegate: DropDownDelegate?
    
    
    func didSelect() {
        guard let delegate = delegate else {
            return
        }
        delegate.didSelectDropDown(withValue: "Success")
    }
}


class LoginViewController: UIViewController, DropDownDelegate {
    func didSelectDropDown(withValue value: String) {
        print(value)
    }
    
    
    
}


protocol Artist {
    var firstnName: String {get}
    var lastName: String {get}
    var fullName: String {get set}
    func getName() -> String
}

extension Artist {
    
    func getName() -> String {
        return firstnName + " " + lastName
    }
    
    var fullName: String {
        get {
            return firstnName + " " + lastName
        }
        set {
            fullName = newValue
        }
        
    }
}


struct Actor: Artist {
    var firstnName: String
    var lastName: String
    
    
}


//Generics

struct Swapable {
    
    
    
    func swap<T>( a: inout T, b: inout T) {
        
        var temp : T
        temp = a
        a = b
        b = temp
        
    }
}


struct PSwap {
    
    var a = 100
    var b = 120

    mutating func sap() {
        let swap = Swapable()
        swap.swap(a: &a, b: &b)
    }
    

}


//Stack using Generics


struct IntStack {
    
    var items: [Int]
    
    mutating func push(element: Int) {
        
        self.items.append(element)
    }
    
    mutating func pop() {
        
        self.items.removeLast()
    }
}



struct Stack<Element: Hashable> {
    
    var items: [Element]
    
    mutating func push(element: Element) {
        self.items.append(element)
    }
    
    mutating func pop() {
        
        self.items.removeLast()
    }
}



var stackable = Stack<Int>(items: [1,2,3,4,5,6])



extension Stack {
    
    func topElement() -> Element?{
        
        return self.items.last
    }
}


protocol TempPro {
    
    var val: String {get set}
}



struct tempp: TempPro {
    var val: String
    
}


//Memory Reference


class PersonClass {
    
    var name: String?
    
    deinit {
        
    }
}

class Apartment {
    
    var number: String?
    weak var owner: PersonClass?
    
    deinit {
        
    }
    
}


class Account {
    var name: String?
    
}

class Card {
    var number: String?
    unowned var account: Account
    
    init(withAccount account: Account) {
        self.account = account
        
    }
}


extension Numeric {
    
    func squared() -> Self {
        
        self * self
    }
}


let squareInt = 3.squared()
let squareDouble = 3.4.squared()




 public class tempera{
      var ttt: String?
}


class temp1 {
    
    fileprivate var tem: tempera?
}
