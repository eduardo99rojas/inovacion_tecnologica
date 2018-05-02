//
//  detalle_Egresados.swift
//  IT-SC
//
//  Created by Eduardo Rojas Alvarez on 01/05/18.
//  Copyright © 2018 Eduardo Rojas Alvarez. All rights reserved.
//

import Foundation
import UIKit

class Detalle_Egresados : UIViewController {
    
    //MARK: - General
    var informacion_egresado: Egresados?
    
    //MARK: - Conexiones Generales
    @IBOutlet weak var Nombre: UILabel!
    @IBOutlet weak var Carrera: UILabel!
    @IBOutlet weak var Empresa_dondeLabora: UILabel!
    @IBOutlet weak var Generacion: UILabel!
    @IBOutlet weak var Descripcion: UITextView!
    @IBOutlet weak var image_dePerfil: UIImageView!
    
    //MARK: Redes sociales
    //Facebook
    @IBAction func Facebook(_ sender: Any) {
        
        if self.informacion_egresado != nil{
         
            if self.informacion_egresado?.perfilDeFacebook != nil, let url = URL.init(string: (self.informacion_egresado?.perfilDeFacebook!)!){
                
                UIApplication.shared.openURL(url)
                
            }
        }
    }
    
    //Twitter
    @IBAction func Twitter(_ sender: Any) {
        
        if self.informacion_egresado != nil{
            
            if self.informacion_egresado?.perfilTwitter != nil, let url = URL.init(string: (self.informacion_egresado?.perfilTwitter!)!){
                
                UIApplication.shared.openURL(url)
                
            }
        }
    }
    
    //LinkedIn
    @IBAction func LinkedIn(_ sender: Any) {
        
        if self.informacion_egresado != nil{
            
            if self.informacion_egresado?.perfilLinkedin != nil, let url = URL.init(string: (self.informacion_egresado?.perfilLinkedin!)!){
                
                UIApplication.shared.openURL(url)
                
            }
        }
    }
    
    //MARK: Cerrar
    @IBOutlet weak var Cerrar: UIButton!
    @IBAction func cerrarVentana(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.informacion_egresado != nil {
        
            //Nombre
            self.Nombre.text = self.informacion_egresado?.nombre
            
            //Carrera
            self.Carrera.text = self.informacion_egresado?.carrera
            
            //Generación
            self.Generacion.text = self.informacion_egresado?.generacion
            
            //Empresa donde labora
            self.Empresa_dondeLabora.text = self.informacion_egresado?.empresa_dondeLabora
            
            //Descripcion
            self.Descripcion.text = self.informacion_egresado?.descripcion
            
            //Imagen de perfil
            self.image_dePerfil.image = self.informacion_egresado?.imagen
        }
    }
    
    //MARK: - ViewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    //MARK: - MemoryWarning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    
}
