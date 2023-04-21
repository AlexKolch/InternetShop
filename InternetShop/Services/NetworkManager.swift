//
//  NetworkManager.swift
//  InternetShop
//
//  Created by Алексей Колыченков on 19.04.2023.
//

import Foundation

protocol Networking {
    func request(url: String, completion: @escaping (Data?, Error?) -> Void)
}

final class NetworkManager: Networking {
    /// Синглтон для работы с сетью
    static let shared: NetworkManager = .init()

    func request(url: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: url) else { return }

        let request = URLRequest(url: url)
        let task = createDataTask(from: request, completion: completion)
        task.resume()
        print(url)
    }

    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { data, _, error in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
}
