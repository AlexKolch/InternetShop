//
//  NetworkDataFetcher.swift
//  InternetShop
//
//  Created by Алексей Колыченков on 19.04.2023.
//

import Foundation

//protocol DataFetcher {
//    func getData(response: @escaping (ResponseModel?) -> Void)
//}
//
//struct NetworkDataFetcher: DataFetcher {
//    let urlString = "https://fakestoreapi.com/products"
//    let networking: Networking
//
//    init(networking: Networking) {
//        self.networking = networking
//    }
//
//    /// Получить данные
//    func getData(response: @escaping (ResponseModel?) -> Void) {
//        networking.request(url: urlString) { data, error in
//            if let error = error {
//                print("Error received requesting data: \(error.localizedDescription)")
//                response(nil)
//            }
////ПРОВЕРИТЬ!!!
//            let decoded = self.decodeJSON(type: MenuResponseWrapped.self, from: data)
//
//            response(decoded?.response)
//        }
//    }
//    /// Декодируем JSON
//    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
//        let decoder = JSONDecoder()
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
//        guard let data = from, let response = try? decoder.decode(type.self, from: data) else { return nil }
//        return response
//    }
//}
