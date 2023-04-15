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

struct ServiceDataSource {
    let sectionName: String
    let content: [(serviceName: String, imageName: String, descripcion: String)]
    
    init(sectionName: String, content: [(serviceName: String, imageName: String, descripcion: String)]) {
        self.sectionName = sectionName
        self.content = content
    }
}

struct Vehicle {
    let supportTitle: String
    let supportType: SupportType
    let imageName: String
    
    init(supportTitle: String, supportTyle: SupportType, imageName: String) {
        self.supportTitle = supportTitle
        self.supportType = supportTyle
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
    
    func getCarServices() -> [ServiceDataSource] {
        let firstLevelService = [
            (serviceName: "Revisar Nivel de Agua", imageName: "flag.checkered", descripcion: "Es ideal revisar el agua de tu auto antes de un viaje largo"),
            (serviceName: "Revisar Aceite de motor", imageName: "flag.checkered", descripcion: "Revisa periodicamente el aceite de tu motor para daños"),
            (serviceName: "Revisar Liquido de frenos", imageName: "flag.checkered", descripcion: "Es necesario hacerlo al menos 1 vez al mes")
        ]
        
        let secondLevelService = [
            (serviceName: "Limpiar Bornes de bateria", imageName: "flag.checkered.2.crossed", descripcion: "Con el tiempo los Bornes puede arquirir sarro"),
            (serviceName: "Reemplazo de Fusibles", imageName: "flag.checkered.2.crossed", descripcion: "Una falla tipica en el funcionamiento adecuado del motor"),
            (serviceName: "Cambio de Filtro de aire", imageName: "flag.checkered.2.crossed", descripcion: "Es aconsejable hacerlo cada 2 servicios")
        ]
        
        let otherLevelService = [
            (serviceName: "Pasar Corriente", imageName: "exclamationmark.triangle", descripcion: "Si te quedas si carga puedes seguir los siguientes pasos"),
            (serviceName: "Cambio de aceite", imageName: "exclamationmark.triangle", descripcion: "Necesitas equipo especial para hacerlo"),
            (serviceName: "Cambio liquido de frenos", imageName: "exclamationmark.triangle", descripcion: "Tarea sencilla y necesaria")
        ]
        
        let data = [
            ServiceDataSource(sectionName: "Mantenimiento de Primer Nivel", content: firstLevelService),
            ServiceDataSource(sectionName: "Mantenimiento de segundo Nivel", content: secondLevelService),
            ServiceDataSource(sectionName: "Avanzado", content: otherLevelService)
        ]
        
        return data
    }
}


