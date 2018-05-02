//
//  conexion_noticias.swift
//  IT-SC
//
//  Created by Eduardo Rojas Alvarez on 02/04/18.
//  Copyright © 2018 Eduardo Rojas Alvarez. All rights reserved.
//

import Foundation
import UIKit
struct todasLasNotas: Decodable{
    
    let articles: [articulos?]
    
}

struct articulos : Decodable{
    
    let url: String?
    let description: String?
    let title: String?
    let author: String?
    let urlToImage: String?
    
}

//Clase de conexion con noticias; las noticias que se obtienen son de google news por lo tanto cualquier informacion adicional acerca de los parametros de debe consultar en: https://newsapi.org

class Conexion_Noticias: NSObject, URLSessionDataDelegate {

    //Funcion que se encarga de descargar la informacion
    public func getArticles(key:String, completionHandler: @escaping (Data) -> ()) {
        
        let site = "https://newsapi.org/v2/top-headlines?country=mx&category=technology&pageSize=50&apiKey=\(key)"
        let url = URL(string: site)
        var request = URLRequest(url: url!)
        
        request.httpMethod = "GET"
        let session = URLSession.shared
        
        session.dataTask(with: request) {data, response, err in
            
            if (err != nil) {
                completionHandler(Data())
            } else {
                completionHandler(data!)
            }
            
            }.resume()
        
    }
    
}










