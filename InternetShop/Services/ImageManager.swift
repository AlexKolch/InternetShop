//
//  ImageManager.swift
//  InternetShop
//
//  Created by Алексей Колыченков on 19.04.2023.
//

import UIKit

final class WebImageManager: UIImageView {
    /// Синглтон для работы с изображениями
static let shared: WebImageManager = .init()

    /// Получить изображение и закэшировать
    func set(imageUrl: String) {
            guard let url = URL(string: imageUrl) else {return}
            if let cashedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
                DispatchQueue.main.async {
                    self.image = UIImage(data: cashedResponse.data)
                }
            }

        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            DispatchQueue.main.async {
                if let data = data, let response = response {
                    self?.image = UIImage(data: data)
                    self?.cashLoadedImage(data: data, response: response)
                }
            }
        }
        dataTask.resume()
    }

    ///Создание кэша
    private func cashLoadedImage(data: Data, response: URLResponse) {
        guard let responseURL = response.url else {return}

        let cashedResponse = CachedURLResponse(response: response, data: data)

        URLCache.shared.storeCachedResponse(cashedResponse, for: URLRequest(url: responseURL))
    }
}
