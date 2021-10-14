//
//  ViewController.swift
//  iOS_Week_1
//
//  Created by Erkut Bas on 19.09.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goToAlgorithmPage(_ sender: Any) {
        
        guard let viewController = storyboard?.instantiateViewController(identifier: "AlgorithmViewController") else {
            fatalError("Opps there is no such viewController")
        }
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    @IBAction func basicsTest(_ sender: Any) {
        // please provide a couple of sample functionality for class, struct and enum use cases by creating your own modules. We provide you some sample class, enum and struct please provide your own.
        // The code below is just sample
        let mercedesEngine = Engine(volume: 1496, modelCode: "M 264 E 15 DEH LA", manifacturer: "Mercedes-Benz", productionDate: Date(), power: 170, torque: 250, fuelType: FuelType.gasoline, cylinderCount: 4, transmission: TransmissionType.automatic, cylinderLayout: CylinderLayout.inline)
        let car = Car(manifacturer: "Mercedes-Benz", model: "C180 (W206)", engine: mercedesEngine, type: CarType.sedan, modelYear: 2021, color: "Black", VIN: "123A2DGFAZX" )
        
        //Print catalogue data for simple car.
        car.details()
        //Have a little test drive.
        car.testRide()
        
        let toyotaEngine = Engine(volume: 2997, modelCode: "2JZ-GTE", manifacturer: "Toyota", productionDate: Date(), power: 330, torque: 441, fuelType: FuelType.gasoline, cylinderCount: 6, transmission: TransmissionType.manual, cylinderLayout: CylinderLayout.inline)
        let supra = Toyota(model: "Supra", engine: toyotaEngine, type: CarType.coupe, modelYear: 1993, color: "Red", VIN: "AX967DDCQ34")
        
        //Print catalogue data for our beloved Supra.
        supra.details()
        //Are you ready to fly?
        supra.testRide()
        
    }

    
}

