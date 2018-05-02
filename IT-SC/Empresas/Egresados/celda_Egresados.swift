//
//  celda_Egresados.swift
//  IT-SC
//
//  Created by Eduardo Rojas Alvarez on 04/04/18.
//  Copyright © 2018 Eduardo Rojas Alvarez. All rights reserved.
//

import Foundation
import UIKit

class celda_Egresados: UITableViewCell{
    
    //MARK: - General
    var egresado: Egresados?
    
    //MARK: - Conexiones generales
    @IBOutlet weak var nombre_deEgresado: UILabel!
    @IBOutlet weak var imagen_deEgresado: UIImageView!
    @IBOutlet weak var generacion_deEgresado: UILabel!
    @IBOutlet weak var carrera_deEgresado: UILabel!
    
}
