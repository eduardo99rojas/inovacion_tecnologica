//
//  examenes_detalle.swift
//  IT-SC
//
//  Created by Eduardo Rojas Alvarez on 01/05/18.
//  Copyright © 2018 Eduardo Rojas Alvarez. All rights reserved.
//

import Foundation
import UIKit

class Examenes_Detalle: UIViewController{
    
    //MARK: - General
    var examenActual: examenes_Info?
    
    //MARK: - Conexiones generales
    @IBOutlet weak var Titulo: UILabel!
    @IBOutlet weak var descripcionBreve: UITextView!
    @IBOutlet weak var Caracteristicas: UITextView!
    @IBOutlet weak var Temas: UITextView!
    
    //MARK: Cerrar
    @IBOutlet weak var Cerrar: UIButton!
    @IBAction func cerrarVentana(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.examenActual != nil {
            
            //Descripcion
            self.descripcionBreve.text = self.examenActual?.descripcion
            
            //Características
            if examenActual!.caracteristicas != nil {
                
                var textoFinal = ""
                
                for x in (self.examenActual?.caracteristicas)!{
                    
                    if x != nil {
                        textoFinal.append("\(x!)\n")
                    }
                }
                
                self.Caracteristicas.text = textoFinal
            }
            
            //Temas
            if examenActual!.temas != nil {
                
                var textoFinal = ""
                
                for x in (self.examenActual?.temas)!{
                    
                    if x != nil {
                        textoFinal.append("\(x!)\n")
                    }
                }
                
                self.Temas.text = textoFinal
            }
            
            //Titulo
            self.Titulo.text = self.examenActual?.titulo
        }
        
    }
    
    //MARK: - ViewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    //MARK: - Memory Warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    
}
