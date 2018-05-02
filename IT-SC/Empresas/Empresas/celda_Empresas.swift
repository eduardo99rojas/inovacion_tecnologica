//
//  celda_Empresas.swift
//  IT-SC
//
//  Created by Eduardo Rojas Alvarez on 04/04/18.
//  Copyright © 2018 Eduardo Rojas Alvarez. All rights reserved.
//

import Foundation
import UIKit

class celda_Empresas: UITableViewCell{
    
    //MARK: - General
    var empresa: Empresas?
    
    //MARK: - Conexiones generales
    @IBOutlet weak var nombre_deEmpresa: UILabel!
    @IBOutlet weak var sector_deEmpresa: UILabel!
    @IBOutlet weak var descripcion_deEmpresa: UILabel!
    
}
