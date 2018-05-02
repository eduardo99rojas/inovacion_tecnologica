//
//  variablesGlobales.swift
//  IT-SC
//
//  Created by Eduardo Rojas Alvarez on 03/04/18.
//  Copyright © 2018 Eduardo Rojas Alvarez. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Arreglos
//Imagenes descargadas para evitar la descarga repetida de imagenes
var imagenesDescargadas = [String:UIImage?]()

//MARK: - Llaves
//Llaves para el acceso a datos guardados
struct llavesDefault {
    
    static let ultimoContenido_aMostrar = "UltimoContenidoAMostrar_PlanDeEstudios"
    
}

//MARK: - Colores
//Colores de utilizacion en diferentes secciones
let colorTec = UIColor(red: 18/255, green: 55/255, blue: 159/255, alpha: 1.0)
let colorTec_noSeleccionado = UIColor(red: 18/255, green: 55/255, blue: 159/255, alpha: 0.5)
