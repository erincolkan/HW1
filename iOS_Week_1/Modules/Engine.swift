//
//  Engine.swift
//  iOS_Week_1
//
//  Created by Erinç Olkan Dokumacıoğlu on 21.09.2021.
//

import Foundation

typealias EngineVolume = Int
typealias HorsePower = Int
typealias NewtonMeters = Int

//I know there is much to engines such as material, turbocharged, belt/chain driven etc.
//But for now, I think this suffices.
struct Engine {
    var volume: Int
    var modelCode: String
    var manifacturer: String
    var productionDate: Date
    var power: HorsePower
    var torque: NewtonMeters
    var fuelType: FuelType
    var cylinderCount: Int
    var cylinderLayout: CylinderLayout
    var transmission: TransmissionType
    
    init(volume: Int, modelCode: String,
         manifacturer: String, productionDate: Date,
         power: HorsePower, torque: NewtonMeters,
         fuelType: FuelType, cylinderCount: Int,
         transmission: TransmissionType, cylinderLayout: CylinderLayout) {
        self.volume = volume
        self.modelCode = modelCode
        self.manifacturer = manifacturer
        self.productionDate = productionDate
        self.power = power
        self.torque = torque
        self.fuelType = fuelType
        self.cylinderCount = cylinderCount
        self.cylinderLayout = cylinderLayout
        self.transmission = transmission
    }
    
    func details() {
        print("Engine details:")
        print("""
        This \(volume)cc engine with model code \(modelCode) manifactured by \(manifacturer) on \(productionDate)
        uses \(fuelType.rawValue) type of fuel to produce \(power)HPs and \(torque)N/ms of torque. This engine
        also is \(cylinderCount) cylinder engine with \(cylinderLayout.rawValue) layout and comes with \(transmission)
        transmission.
        """)
        print("")
    }
    
}
