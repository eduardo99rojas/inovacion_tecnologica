//
//  todas_lasImagenes.swift
//  IT-SC
//
//  Created by Eduardo Rojas Alvarez on 01/05/18.
//  Copyright © 2018 Eduardo Rojas Alvarez. All rights reserved.
//

import Foundation
import UIKit

class todas_LasImagenes : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //MARK: - General
    var array_deImagenes: [UIImage]?
    
    //MARK: - Conexiones Generales
    //Lista
    @IBOutlet weak var coleccion_deImagenes: UICollectionView!
    
    //MARK: Cerrar
    @IBOutlet weak var Cerrar: UIButton!
    @IBAction func cerrarVentna(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Cambiar la configuracion de espacio para mejorarlo de forma visual
        let dimensiones_deItem = UIScreen.main.bounds.width/3 - 3
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsetsMake(20, 0, 10, 0)
        layout.itemSize = CGSize.init(width: dimensiones_deItem, height: dimensiones_deItem)
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        
        //Colocar la nueva configuracion de diseño
        self.coleccion_deImagenes.collectionViewLayout = layout
        self.coleccion_deImagenes.delegate = self
        self.coleccion_deImagenes.dataSource = self
        self.coleccion_deImagenes.reloadData()
    }
    
    //MARK: - ViewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    //MARK: - MemoryWarning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
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

}
