//
//  FirstViewController.swift
//  IT-SC
//
//  Created by Eduardo Rojas Alvarez on 02/04/18.
//  Copyright © 2018 Eduardo Rojas Alvarez. All rights reserved.
//

import Foundation
import UIKit

class Noticias: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: - General
    var noticias: [articulos?]?
    
    //MARK: - Notas Generales
    @IBOutlet weak var lista_deArticulos: UITableView!
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Asignar delegate y dataSource a tabla
        self.lista_deArticulos.delegate = self
        self.lista_deArticulos.dataSource = self
        
        self.cargar_yMostrar_Noticias()
        
    }

    //MARK: - ViewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    //MARK: - MemoryWarning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    //MARK: - Cargar noticias
    func cargar_yMostrar_Noticias(){
        
        let noticias = Conexion_Noticias.init()
        DispatchQueue.main.async {
            noticias.getArticles(key: "f55a72b34dd241f2acbe7ba34c5f6607", completionHandler: {info in
                do {
                    let json = try JSONDecoder().decode(todasLasNotas.self, from: info)
                    
                    self.noticias = json.articles
                    
                    DispatchQueue.main.sync {
                        self.lista_deArticulos.reloadData()
                    }
                    
                } catch {
                    print("error serializing JSON: \(error)")
                }
            })
        }
        
    }
    
    //MARK: - TableView delegates
    //Cantidad de celdas en seccion
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.noticias != nil {
            return (self.noticias?.count)!
            
        } else{return 0}
    }
    
    //Personalizar celda
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var celda = UITableViewCell()
        
        if let celda_deNota = tableView.dequeueReusableCell(withIdentifier: "articulo", for: indexPath) as? celda_articulo{
            
            if self.noticias != nil{
                if self.noticias![indexPath.row] != nil {
                    
                    celda_deNota.articulo = self.noticias![indexPath.row]
                    celda_deNota.BreveDescripcion_deNota.text = (self.noticias![indexPath.row])!.description
                    celda_deNota.Titulo_deNota.text = (self.noticias![indexPath.row])!.title
                    
                    if (self.noticias![indexPath.row])!.urlToImage != nil {
                        if (self.noticias![indexPath.row])!.urlToImage != nil {
                            
                            if imagenesDescargadas[(self.noticias![indexPath.row])!.urlToImage!] != nil{
                                
                                celda_deNota.Imagen_deNota.image = imagenesDescargadas[(self.noticias![indexPath.row])!.urlToImage!]!
                            } else{
                                celda_deNota.Imagen_deNota.imageFromServerURL(urlString: (self.noticias![indexPath.row])!.urlToImage!)
                            }
                        }
                    }
                }
            }
            
            celda = celda_deNota
        }
        
        return celda
    }
    
    //Va a mostrar una celda
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if let celda_deNota = tableView.cellForRow(at: indexPath) as? celda_articulo{
            
            //Quitar imagen
            celda_deNota.Imagen_deNota.image = UIImage.init(named: "imagen-no-disponible")
            
            //Actualizar informacion dinamica
            if self.noticias != nil{
                if self.noticias![indexPath.row] != nil {
                    celda_deNota.BreveDescripcion_deNota.text = (self.noticias![indexPath.row])!.description
                    celda_deNota.Titulo_deNota.text = (self.noticias![indexPath.row])!.title
                    if (self.noticias![indexPath.row])!.urlToImage != nil {
                        
                        if imagenesDescargadas[(self.noticias![indexPath.row])!.urlToImage!] != nil{
                            
                            celda_deNota.Imagen_deNota.image = imagenesDescargadas[(self.noticias![indexPath.row])!.urlToImage!]!
                        }
                    }
                }
            }
        }
    }
    
    //Seleccion de celda
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let celda_Nota = tableView.cellForRow(at: indexPath) as? celda_articulo{
            
            if celda_Nota.articulo != nil {
             
                if celda_Nota.articulo?.url != nil, let url = URL.init(string: (celda_Nota.articulo?.url!)!){
                    
                    UIApplication.shared.openURL(url)
                }
            }
        }
        
        //Deselccionar nota
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //Altura de celda
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115.0
    }
    
}

