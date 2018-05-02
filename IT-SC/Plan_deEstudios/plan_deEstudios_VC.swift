//
//  plan_deEstudios_VC.swift
//  IT-SC
//
//  Created by Eduardo Rojas Alvarez on 03/04/18.
//  Copyright © 2018 Eduardo Rojas Alvarez. All rights reserved.
//

import Foundation
import UIKit

class plan_deEstudios : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MAKR: - General
    let defaults = UserDefaults.standard
    
    //Protocolo que indica el contenido que se debe mostrar
    // 1 = Materias
    // 2 = Exámenes
    var protocolo_deQueMuestra = 1
    
    //Array de materias
    var array_materias: [materias_Info]?
    //Materia seleccionada
    var materiaSeleccionada = materias_Info()
    
    //Array de examenes
    var array_examenes: [examenes_Info]?
    //Examen seleccionado
    var examenSeleccionado = examenes_Info()
    
    //MARK: - Conexiones Generales
    @IBOutlet weak var descripcion_deCarrera: UITextView!
    
    //Botones de cambios de contenido de lista
    //Materias
    @IBOutlet weak var Materias: UIButton!
    @IBAction func materias_A(_ sender: Any) {
        
        print("HEYYY materias")
        
        //Cambiar el protocolo de datos a mostrar
        self.protocolo_deQueMuestra = 1
        
        //Cambiar colores de botones
        self.configurarColores_BotonesContenido()
        
        self.ListaGeneral.reloadData()
    }
    
    //Examenes
    @IBOutlet weak var Examenes: UIButton!
    @IBAction func examenes_A(_ sender: Any) {
        
        print("HEYYY Examenes")
        
        //Cambiar el protocolo de datos a mostrar
        self.protocolo_deQueMuestra = 2
        
        //Cambiar colores de botones
        self.configurarColores_BotonesContenido()
        
        self.ListaGeneral.reloadData()
    }
    
    //Configurar colores
    func configurarColores_BotonesContenido(){
        
        if protocolo_deQueMuestra == 1{
            
            self.Examenes.backgroundColor = colorTec_noSeleccionado
            self.Materias.backgroundColor = colorTec
        } else if protocolo_deQueMuestra == 2{
            
            self.Examenes.backgroundColor = colorTec
            self.Materias.backgroundColor = colorTec_noSeleccionado
            
        }
        
    }
    
    //Lista general
    @IBOutlet weak var ListaGeneral: UITableView!
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for x in 1...5{
            
            let materia = materias_Info()
            materia.nombre = "Materia #\(x)"
            materia.descripcion = "Esta es la materia \(x) y esta materia consiste de \(x * 2) horas a la semana."
            
            for o in 1...5{
             
                if materia.aptitudes == nil {

                    materia.aptitudes = ["Aptitud \(o)-."]
                } else{
                    materia.aptitudes?.append("Aptitud \(o)-.")
                }
                
                if materia.objetivos == nil {
                    
                    materia.objetivos = ["Objetivo \(o)"]
                } else{
                    materia.objetivos?.append("Objetivo \(o)")
                }
            }
            
            if self.array_materias != nil {
            
                self.array_materias?.append(materia)
            } else{
                self.array_materias = [materia]
            }
            
            let examen = examenes_Info()
            examen.titulo = "Exámen de ejemplo #\(x)"
            examen.descripcion = "Este examen cuenta de \(x * 10) preguntas, es pratico pero además consta de una sección de opción múltiple."
            
            if self.array_examenes != nil {
                
                self.array_examenes?.append(examen)
            } else{
                self.array_examenes = [examen]
            }
            
            for o in 1...5{
                
                if examen.temas == nil{
                
                    examen.temas = ["Tema \(o)*"]
                } else{
                    examen.temas?.append("Tema \(o)*")
                }
                
                if examen.caracteristicas == nil {
                    
                    examen.caracteristicas = ["Característica \(o)"]
                } else{
                    examen.caracteristicas?.append("Característica \(o)")
                }
            }
        }
        
        //Configuracion inicial de listaGeneral
        self.ListaGeneral.delegate = self
        self.ListaGeneral.dataSource = self
        
        configurarColores_BotonesContenido()
    }
    
    //MARK: - ViewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    //MARK: - MemoryWarning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    
    //MARK: - TableViewDelegates
    //Numero de secciones
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Numero de celdas en seccion
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //Buscar numero de celdas en seccion, revisando que no este vacio el array de materias, o el de examenes en el caso que tenga que ser, dependiendo del protocolo de seleccion de contenido a mostrar
        var numeroDeCeldas_enSeccion : Int? {
         
            if self.protocolo_deQueMuestra == 1, self.array_materias?.isEmpty == false,self.array_materias != nil  {
                
                return self.array_materias?.count
                  
            } else if self.protocolo_deQueMuestra == 2, self.array_examenes != nil, self.array_examenes?.isEmpty == false  {
                
                return self.array_examenes?.count
                
            }else {return nil}
        }
        
        if numeroDeCeldas_enSeccion != nil {
            return numeroDeCeldas_enSeccion!
            
        } else{return 0}
        
    }
    
    //Editar celda
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var celda = UITableViewCell()
        
        //Revisar si se puede obtener la celda en base al protocolo de datos a mostrar
        if self.protocolo_deQueMuestra == 1, let celda_materia = tableView.dequeueReusableCell(withIdentifier: "materias") as? celda_Materias {
            
            //Checar que no ésten vacíos los datos que se necesitan y mostrarlos
            if self.array_materias != nil{
             
                celda_materia.materia = array_materias![indexPath.row]
                
                if array_materias![indexPath.row].nombre != nil {
                    
                    celda_materia.nombre_deMateria.text = array_materias![indexPath.row].nombre
                }
                if array_materias![indexPath.row].descripcion != nil {
                    
                    celda_materia.descripcion_deMateria.text = array_materias![indexPath.row].descripcion
                }
            }
            
            celda = celda_materia
        } else if self.protocolo_deQueMuestra == 2, let celda_examen = tableView.dequeueReusableCell(withIdentifier:"examenes") as? celda_Examenes{
            
            celda_examen.examen = array_examenes![indexPath.row]
            
            //Checar que no ésten vacíos los datos que se necesitan y mostrarlos
            if self.array_examenes != nil{
                
                if array_examenes![indexPath.row].descripcion != nil {
                    
                    celda_examen.descripcion_deExamen.text = array_examenes![indexPath.row].descripcion
                }
                if array_examenes![indexPath.row].titulo != nil {
                    
                    celda_examen.titulo_deExamen.text = array_examenes![indexPath.row].titulo
                }
            }
            
            celda = celda_examen
        }
        
        return celda
    }
    
    //Datos dinamicos de celda
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        
        
    }
    
    //Alto de celda
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    //Selecciono celda
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Protocolos:
        //1 == Materias
        //2 == Examenes
        if self.protocolo_deQueMuestra == 1, let celda_materia = tableView.cellForRow(at: indexPath) as? celda_Materias{
            
            if celda_materia.materia != nil {
            
                self.materiaSeleccionada = celda_materia.materia!
                
                self.performSegue(withIdentifier: "detalle_deMaterias", sender: self)
                
            }
        } else if self.protocolo_deQueMuestra == 2, let celda_examen = tableView.cellForRow(at: indexPath) as? celda_Examenes{
            
            if celda_examen.examen != nil {
                
                self.examenSeleccionado = celda_examen.examen!
                
                self.performSegue(withIdentifier: "detalle_deExamenes", sender: self)
            }
        }
        
        //Deseleccionar la celda
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detalle_deMaterias", let controllerFinal = 
            segue.destination as? Materias_Detelle {
            
            controllerFinal.materiaActual = self.materiaSeleccionada
            
        } else if segue.identifier == "detalle_deExamenes", let controllerFinal =
            segue.destination as? Examenes_Detalle {
            
            controllerFinal.examenActual = self.examenSeleccionado
            
        }
    }
    
}
