//
//  articulo_celda.swift
//  IT-SC
//
//  Created by Eduardo Rojas Alvarez on 03/04/18.
//  Copyright © 2018 Eduardo Rojas Alvarez. All rights reserved.
//
import Foundation
import UIKit

class celda_articulo : UITableViewCell{
    
    //MARK: - General
    var articulo: articulos?
    
    //MARK: - Conexiones Generales
    @IBOutlet weak var Imagen_deNota: UIImageView!
    @IBOutlet weak var Titulo_deNota: UILabel!
    @IBOutlet weak var BreveDescripcion_deNota: UITextView!
    
    
}
