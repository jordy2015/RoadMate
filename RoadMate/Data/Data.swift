//
//  Data.swift
//  RoadMate
//
//  Created by Jordy Gonzalez on 14/04/23.
//

import Foundation

enum SupportType {
case car
case moto
case trailer
}

struct Vehicle {
    let supportTitle: String
    let supportTyle: SupportType
    let imageName: String
    
    init(supportTitle: String, supportTyle: SupportType, imageName: String) {
        self.supportTitle = supportTitle
        self.supportTyle = supportTyle
        self.imageName = imageName
    }
}

class Data {
    static let `default` = Data()
    
    func getCarData() -> [Vehicle] {
        let carData = [
            Vehicle(supportTitle: "Motor", supportTyle: .car, imageName: "carEngine"),
            Vehicle(supportTitle: "Llantas", supportTyle: .car, imageName: "carTires"),
            Vehicle(supportTitle: "Tablero", supportTyle: .car, imageName: "carBoard"),
            Vehicle(supportTitle: "Luces", supportTyle: .car, imageName: "carLights"),
            Vehicle(supportTitle: "Frenos", supportTyle: .car, imageName: "carBrakes")
        ]
        return carData
    }
    
    func getMotoData() -> [Vehicle] {
        let motoData = [
            Vehicle(supportTitle: "Carburador", supportTyle: .moto, imageName: "motoCarburador"),
            Vehicle(supportTitle: "Motor", supportTyle: .moto, imageName: "motoEngine"),
            Vehicle(supportTitle: "Escape", supportTyle: .moto, imageName: "motoScape"),
            Vehicle(supportTitle: "Llantas", supportTyle: .moto, imageName: "motoTire")
        ]
        return motoData
    }
    
    func getTrailerData() -> [Vehicle] {
        let trailerData = [
            Vehicle(supportTitle: "Motor", supportTyle: .trailer, imageName: "trailerEngine"),
            Vehicle(supportTitle: "Tablero", supportTyle: .trailer, imageName: "boardTrailer"),
            Vehicle(supportTitle: "Llantas", supportTyle: .trailer, imageName: "trailerTires"),
        ]
        return trailerData
    }
}


