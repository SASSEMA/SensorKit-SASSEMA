//
//  ViewController.swift
//  SensorKit Test
//
//  Created by Ethan Swift on 2/12/23.
//

import UIKit
import SensorKit

class ViewController: UIViewController, SRSensorReaderDelegate {
    // A sensor for ambient light information.
    let deviceUsage = SRSensorReader(sensor: .deviceUsageReport)


    // Displays the authorization approval prompt.
    func requestAuthorization() {
        SRSensorReader.requestAuthorization(sensors: [.deviceUsageReport]) { (error: Error?) in
            if let error = error {
                fatalError("Sensor authorization failed due to: \(error)")
            } else {
                print("""
                    User dismissed the authorization prompt.
                    Awaiting authorization status changes.
                """)
            } } }


    // Sets up the view.
    override func viewDidLoad() {


        // Listen for authorization status changes.
        deviceUsage.delegate = self
        requestAuthorization()
    }


}

