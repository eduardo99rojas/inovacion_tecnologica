//
//  celda_Materias.swift
//  IT-SC
//
//  Created by Eduardo Rojas Alvarez on 03/04/18.
//  Copyright © 2018 Eduardo Rojas Alvarez. All rights reserved.
//

import Foundation
import UIKit

class celda_Materias : UITableViewCell {
    
    //MARK: - General
    var materia : materias_Info?
    
    //MARK: - Conexiones Generales
    @IBOutlet weak var nombre_deMateria: UILabel!
    @IBOutlet weak var descripcion_deMateria: UITextView!
    
}
