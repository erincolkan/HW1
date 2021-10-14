//
//  Car.swift
//  iOS_Week_1
//
//  Created by Erinç Olkan Dokumacıoğlu on 20.09.2021.
//

import Foundation

typealias Year = Int

class Car {
    var manifacturer: String
    var model: String
    var engine: Engine
    var type: CarType
    var VIN: String
    var modelYear: Year
    var color: String
    
    init(manifacturer: String, model: String, engine: Engine, type: CarType,
         modelYear: Year, color: String, VIN: String) {
        self.VIN = VIN
        self.model = model
        self.color = color
        self.type = type
        self.modelYear = modelYear
        self.engine = engine
        self.manifacturer = manifacturer
    }
    
    func turnOn() {
        print("\(engine.cylinderCount) cylinder engine has started to run.")
    }
    
    func turnOff() {
        print("Car has been turned off.")
    }
    
    func revUp() {
        if engine.cylinderCount > 8 {
            print("VROROROROROROROROROROR")
        } else {
            print("vrr vrr")
        }
    }
    
    func decelerate() {
        print("car started to decelerate.")
    }
    
    func lock(){
        print("car has been locked")
    }
    
    func unlock() {
        print("car has been unlocked")
    }
    
    func accelerate() {
        if engine.cylinderCount > 6 {
            print("VUUUTUUUTUTUUUUUUU")
        } else {
            print("vrrrrr")
        }
    }
    
    func details() {
        print("""
        This \(color) \(manifacturer) \(model) with and model year \(modelYear) is a \(type.rawValue).
        VIN number of this car is \(VIN).
        """)
        engine.details()
    }
    
    func testRide() {
        print("Test ride starts:")
        unlock()
        turnOn()
        revUp()
        accelerate()
        decelerate()
        turnOff()
        lock()
        print("")
    }
}

//It might be more logical to store model and manifacturer within the Car class but since our point is to
//make use of inheritance as well, I will use it like this.
class Toyota: Car {
    init(model: String, engine: Engine, type: CarType,
         modelYear: Year, color: String, VIN: String) {
        super.init(manifacturer: "Toyota", model: model, engine: engine,
                   type: type, modelYear: modelYear, color: color, VIN: VIN)
    }
    
    override func turnOn() {
        print("\(engine.cylinderCount) cylinder engine has started to run.")
    }
    
    override func turnOff() {
        if model == "Supra" {
            print("\(engine.modelCode) started roaring.")
        } else {
            print("Toyota engine rev up")
        }
    }
    
    override func revUp() {
        if model == "Supra" {
            print("Magical supra sounds with turbo blowoff of course.")
        } else {
            print("Toyota engine rev up")
        }
    }
    
    //I know this probably doesn't make sense since we could have the same it in the base class.
    override func decelerate() {
        if model == "Supra" {
            print("Supra started to decelerate with cool Supra sounds.")
        } else {
            print("\(manifacturer) \(model) started to decelerate.")
        }
    }
    
    override func lock(){
        if model == "Supra" {
            print("Beast locked down, sir.")
        } else {
            print("\(manifacturer) \(model) locked.")
        }
    }
    
    override func unlock() {
        if model == "Supra" {
            print("Beast unleashed, drive safely.")
        } else {
            print("\(manifacturer) \(model) unlocked.")
        }
    }
    
}


