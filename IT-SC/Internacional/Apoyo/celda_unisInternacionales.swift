//
//  celda_unisInternaciones.swift
//  IT-SC
//
//  Created by Eduardo Rojas Alvarez on 04/04/18.
//  Copyright © 2018 Eduardo Rojas Alvarez. All rights reserved.
//

import Foundation
import UIKit

class celda_UnisInternacionales: UITableViewCell {
    
    //MARK: - General
    var universidad: Universidad?
    
    //MARK: - Conexiones Generales
    @IBOutlet weak var nombre_deUni: UILabel!
    @IBOutlet weak var pais_deUni: UILabel!
    @IBOutlet weak var imagen_deUni: UIImageView!
    
}
