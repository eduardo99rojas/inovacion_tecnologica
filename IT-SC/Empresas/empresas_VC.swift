//
//  empresas_VC.swift
//  IT-SC
//
//  Created by Eduardo Rojas Alvarez on 04/04/18.
//  Copyright © 2018 Eduardo Rojas Alvarez. All rights reserved.
//

import Foundation
import UIKit

class Empresas_VC : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - General
    var array_deEmpresas: [Empresas?]?
    var array_deEgresados: [Egresados?]?
    
    var egresadoActual = Egresados()
    
    //MARK: - Conexiones Generales
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var ContentView: UIView!
    
    @IBOutlet weak var lista_deEmpresas: UITableView!
    @IBOutlet weak var lista_deEgresados: UITableView!
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let egresado1 = Egresados()
        egresado1.nombre = "Eduardo Rojas"
        egresado1.carrera = "Innovación Tecnologica"
        egresado1.generacion = "PTT18"
        egresado1.descripcion = "Aprendió programación desde los 15 años, después de eso continuó su aprendizaje mientras estudiaba secundiaria y preparatoria. \n Autodidacta."
        egresado1.perfilTwitter = "https://twitter.com/lalish_dev"
        egresado1.perfilDeFacebook = "https://www.facebook.com/eduardo.rojas.alvarez"
        egresado1.imagen = UIImage.init(named: "egresado1")
        
        array_deEgresados = [egresado1]
        
        let empresa1 = Empresas()
        empresa1.nombre = "HostGator"
        empresa1.seccion_deTrabajo = "Manejo de servidores."
        empresa1.direccion = "https://www.hostgator.com/"
        
        let empresa2 = Empresas()
        empresa2.nombre = "Facebook"
        empresa2.seccion_deTrabajo = "Manejo de información y redes sociales."
        empresa2.direccion = "https://www.facebook.com/"
        
        let empresa3 = Empresas()
        empresa3.nombre = "Instagram"
        empresa3.seccion_deTrabajo = "Manejo de información y galerias de foto."
        empresa3.direccion = "https://www.instagram.com/"
        
        self.array_deEmpresas = [empresa1, empresa2, empresa3]
        
        //Asignar delegados y configuracion inicial a listas
        self.lista_deEgresados.delegate = self
        self.lista_deEgresados.dataSource = self
        
        self.lista_deEmpresas.delegate = self
        self.lista_deEmpresas.dataSource = self
        
    }
    
    //MARK: - ViewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    //MARK: - MemoryWarning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    
    //MARK: - TableViewDelegate
    //Numero de filas en seccion
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var numeroDeCeldas: Int?{
            
            if tableView == self.lista_deEmpresas {
                
                if self.array_deEmpresas != nil{
                    
                    return (self.array_deEmpresas?.count)!
                } else{return nil}
            } else if tableView == self.lista_deEgresados{
             
                if self.array_deEgresados != nil {
                 
                    return (self.array_deEgresados?.count)!
                } else{return nil}
            } else{return nil}
        }
        
        if numeroDeCeldas != nil {
            return numeroDeCeldas!
        } else{return 0}
    }
    
    //Personalizar la celda
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var celda = UITableViewCell()
        
        if tableView == self.lista_deEmpresas, let celda_deEmpresa = tableView.dequeueReusableCell(withIdentifier: "empresas") as? celda_Empresas{
            
            if self.array_deEmpresas != nil{
                
                if self.array_deEmpresas![indexPath.row] != nil{
                 
                    celda_deEmpresa.empresa = self.array_deEmpresas![indexPath.row]
                    celda_deEmpresa.nombre_deEmpresa.text = self.array_deEmpresas![indexPath.row]?.nombre
                    celda_deEmpresa.sector_deEmpresa.text = self.array_deEmpresas![indexPath.row]?.seccion_deTrabajo
                    
                }
            }
            
            celda = celda_deEmpresa
            
        } else if tableView == self.lista_deEgresados, let celda_deEgresados = tableView.dequeueReusableCell(withIdentifier: "egresados") as? celda_Egresados{
            
            if self.array_deEgresados != nil{
                
                if self.array_deEgresados![indexPath.row] != nil {
                 
                    celda_deEgresados.egresado = self.array_deEgresados![indexPath.row]
                    celda_deEgresados.nombre_deEgresado.text = self.array_deEgresados![indexPath.row]?.nombre
                    celda_deEgresados.generacion_deEgresado.text = self.array_deEgresados![indexPath.row]?.generacion
                    celda_deEgresados.carrera_deEgresado.text = self.array_deEgresados![indexPath.row]?.carrera
                    
                    celda_deEgresados.imagen_deEgresado.image = self.array_deEgresados![indexPath.row]?.imagen
                    
                }
            }
            
            celda = celda_deEgresados
        }
        
        return celda
    }
    
    //Celda seleccionada
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView == self.lista_deEgresados, let celda_egresado = tableView.cellForRow(at: indexPath) as? celda_Egresados{
            
            if celda_egresado.egresado != nil {
                
                self.egresadoActual = celda_egresado.egresado!
                self.performSegue(withIdentifier: "detalle_deEgresados", sender: self)
            }
        } else if tableView == self.lista_deEmpresas, let celda_empresa = tableView.cellForRow(at: indexPath) as? celda_Empresas {
            
            if celda_empresa.empresa != nil {
             
                if celda_empresa.empresa?.direccion != nil, let url = URL.init(string: (celda_empresa.empresa?.direccion)!){
                    
                    UIApplication.shared.openURL(url)
                }
            }
        }
        
        //Deseleccion
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //Altura de celda
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    //MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detalle_deEgresados", let controllerFinal = segue.destination as? Detalle_Egresados{
            
            controllerFinal.informacion_egresado = self.egresadoActual
        }
    }
    
}
