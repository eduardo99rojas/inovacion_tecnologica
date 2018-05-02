//
//  extensiones.swift
//  IT-SC
//
//  Created by Eduardo Rojas Alvarez on 03/04/18.
//  Copyright © 2018 Eduardo Rojas Alvarez. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    public func imageFromServerURL(urlString: String) {
        
        let url = URL.init(string: urlString)
        
        if url != nil, urlString.contains("https") == true {
            
            URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) -> Void in
                
                if error != nil {
                    print(error ?? "Hubo un error al descargar la imagen")
                    return
                }
                DispatchQueue.main.async{
                    let image = UIImage(data: data!)
                    
                    //Si la imagen se ha descargado exitosamente se agrega al diccionario de imagenes descargadas
                    if imagenesDescargadas[urlString] != nil {
                        
                        imagenesDescargadas.updateValue(image, forKey: urlString)
                    } else{
                        imagenesDescargadas[urlString] = image
                    }
                    
                    self.image = image
                }
                
            }).resume()
        }
    }
}
