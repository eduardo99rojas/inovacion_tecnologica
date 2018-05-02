//
//  celda_Examenes.swift
//  IT-SC
//
//  Created by Eduardo Rojas Alvarez on 03/04/18.
//  Copyright © 2018 Eduardo Rojas Alvarez. All rights reserved.
//

import Foundation
import UIKit

class celda_Examenes: UITableViewCell{
    
    //MARK: - General
    var examen : examenes_Info?
    
    //MARK: - Conexiones Generales
    @IBOutlet weak var titulo_deExamen: UILabel!
    @IBOutlet weak var descripcion_deExamen: UITextView!
    
}
