//
//  materias_detalle.swift
//  IT-SC
//
//  Created by Eduardo Rojas Alvarez on 01/05/18.
//  Copyright © 2018 Eduardo Rojas Alvarez. All rights reserved.
//

import Foundation
import UIKit

class Materias_Detelle: UIViewController{
    
    //MARK: - General
    var materiaActual: materias_Info?
    
    //MARK: - Conexiones generales
    @IBOutlet weak var Titulo: UILabel!
    @IBOutlet weak var descripcionBreve: UITextView!
    @IBOutlet weak var Aptitudes: UITextView!
    @IBOutlet weak var Objetivos: UITextView!
    
    //MARK: Cerrar
    @IBOutlet weak var Cerrar: UIButton!
    @IBAction func cerrarVentana(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.materiaActual != nil {
            
            //Titulo
            self.Titulo.text = self.materiaActual?.nombre
            
            //Descripcion Breve
            self.descripcionBreve.text = self.materiaActual?.descripcion
            
            //Aptitudes
            if self.materiaActual!.aptitudes != nil {
                
                var textoFinal = ""
                
                for x in (self.materiaActual?.aptitudes)! {
                 
                    if x != nil {
                     
                        textoFinal.append("\(x!)\n")
                    }
                }
                
                self.Aptitudes.text = textoFinal
            }
            
            //Objetivos
            if self.materiaActual!.objetivos != nil {
                
                var textoFinal = ""
                
                for x in (self.materiaActual?.objetivos)! {
                    
                    if x != nil {
                        
                        textoFinal.append("\(x!)\n")
                    }
                }
                
                self.Objetivos.text = textoFinal   
            }
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
