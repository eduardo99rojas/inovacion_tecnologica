//
//  internacional_VC.swift
//  IT-SC
//
//  Created by Eduardo Rojas Alvarez on 04/04/18.
//  Copyright © 2018 Eduardo Rojas Alvarez. All rights reserved.
//

import Foundation
import UIKit

class internacional: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    
    //MARK: - General
    var array_deImagenes: [UIImage]?
    var array_deUniversidades: [Universidad]?
    
    //MARK: - Conexiones Generales
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var lista_deUniversidades: UITableView!
    
    @IBOutlet weak var coleccion_deImagenes: UICollectionView!
    
    @IBOutlet weak var descripcion_general: UITextView!
    
    //Boton para ver todas las imagenes disponibles
    @IBOutlet weak var verTodas_LasImagenes: UIButton!
    @IBAction func mostrar_todasLasImagenes(_ sender: Any) {
        
        self.performSegue(withIdentifier: "todas_lasImagenes", sender: self)
        
    }
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let u1 = Universidad()
        u1.nombre = "Massachusetts Institute of Technology (MIT)"
        u1.pais = "EU"
        u1.direccion = "http://web.mit.edu/"
        u1.imagen = UIImage.init(named: "i1")
        
        let u2 = Universidad()
        u2.nombre = "Stanford University"
        u2.pais = "EU"
        u2.direccion = "https://www.stanford.edu/"
        u2.imagen = UIImage.init(named: "i2")
        
        let u3 = Universidad()
        u3.nombre = "Harvard University"
        u3.pais = "EU"
        u3.direccion = "https://www.harvard.edu/"
        u3.imagen = UIImage.init(named: "i3")
        
        self.array_deUniversidades = [u1,u2,u3]
        
        //Crear valores duros para prototipo
        for x in 1...6{
            
            let img = UIImage.init(named: "i\(x)")
            if img != nil {
             
                if self.array_deImagenes == nil {
                    self.array_deImagenes = [img!]
                } else{
                    self.array_deImagenes?.append(img!)
                }
            }
        }
        
        //Cambiar la configuracion de espacio para mejorarlo de forma visual
        let dimensiones_deItem = UIScreen.main.bounds.width/3 - 3
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsetsMake(20, 0, 10, 0)
        layout.itemSize = CGSize.init(width: dimensiones_deItem, height: dimensiones_deItem)
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        
        //Colocar la nueva configuracion de diseño
        self.coleccion_deImagenes.collectionViewLayout = layout
        
        //Asignar delegados y configuraciones iniciales de coleccion de imagenes y lista de unis
        self.lista_deUniversidades.delegate = self
        self.lista_deUniversidades.dataSource = self
        
        self.coleccion_deImagenes.delegate = self
        self.coleccion_deImagenes.dataSource = self
        
    }
    
    //MARK: - ViewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    //MARK: - MemoryWarning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //MARK: - TableView Delegates
    //Numero de celdas en seccion
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.array_deUniversidades != nil {
          return (self.array_deUniversidades?.count)!
        } else {return 0}
    }
    
    //Configurar celda
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var celda = UITableViewCell()
        //Buscar la celda local, checar que sea del tipo que buscamos y hacer todos los cambios necesarios para mostrar info
        if let celda_deUniversidad = tableView.dequeueReusableCell(withIdentifier: "unis_internacionales") as? celda_UnisInternacionales{
            
            if self.array_deUniversidades != nil {
                
                celda_deUniversidad.universidad = self.array_deUniversidades![indexPath.row]
                
                celda_deUniversidad.nombre_deUni.text = self.array_deUniversidades![indexPath.row].nombre
                
                celda_deUniversidad.pais_deUni.text = self.array_deUniversidades![indexPath.row].pais
                
                //En caso de descargar las imagenes de internet se debe hacer otra implementacion
                celda_deUniversidad.imagen_deUni.image = self.array_deUniversidades![indexPath.row].imagen
                
            }
            
            celda = celda_deUniversidad
        }
        
        return celda
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    //Celda seleccionada
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let celda_universidad = tableView.cellForRow(at:indexPath) as? celda_UnisInternacionales {
            
            if celda_universidad.universidad != nil, celda_universidad.universidad?.direccion != nil {
             
                if let url = URL.init(string: (celda_universidad.universidad?.direccion)!){
                    
                    UIApplication.shared.openURL(url)
                    
                }
            }
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - CollectionView Delegates
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.array_deImagenes != nil {
            return (self.array_deImagenes?.count)!
        } else{return 0}
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var item = UICollectionViewCell()
        
        //Buscar el item local y hacer las ediciones necesarias
        if let item_conImagenL = collectionView.dequeueReusableCell(withReuseIdentifier: "imagen", for: indexPath) as? item_conImagen{
            
            if self.array_deImagenes != nil {
            
                item_conImagenL.imagen.image = self.array_deImagenes?[indexPath.row]
            }
            
            item = item_conImagenL
        }
        
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    //MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "todas_lasImagenes", let controllerFinal = segue.destination as? todas_LasImagenes{
            
            if array_deImagenes != nil {
            
                controllerFinal.array_deImagenes = self.array_deImagenes!
            }
        }
    }
}
