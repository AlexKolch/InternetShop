//
//  NetworkManager.swift
//  InternetShop
//
//  Created by Алексей Колыченков on 19.04.2023.
//

import Foundation

//protocol Networking {
//    func request(url: String, completion: @escaping (Data?, Error?) -> Void)
//}
//
//final class NetworkManager: Networking {
//    /// Синглтон для работы с сетью
//    static let shared: NetworkManager = .init()
//
//    func request(url: String, completion: @escaping (Data?, Error?) -> Void) {
//        guard let url = URL(string: url) else { return }
//
//        let request = URLRequest(url: url)
//        let task = createDataTask(from: request, completion: completion)
//        task.resume()
//        print(url)
//    }
//
//    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
//        return URLSession.shared.dataTask(with: request) { data, _, error in
//            DispatchQueue.main.async {
//                completion(data, error)
//            }
//        }
//    }
//}

/// Синглтон для работы с сетью
final class NetworkManager {

    static let shared: NetworkManager = .init()

    /// Получить данные
    func fetchData<T: Decodable>(_ type: T.Type, from url: String?,
                   completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: url ?? "") else {
            completion(.failure(.invalidURL))
            print(NetworkError.invalidURL.rawValue)
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No Error Description")
                return
            }
            do {
                let type = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(type))
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
