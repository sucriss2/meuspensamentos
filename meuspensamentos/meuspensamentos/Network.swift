//
//  Network.swift
//  meuspensamentos
//
//  Created by Suh on 05/06/23.
//

import Foundation

class Network {
    private var session: URLSession
    static var shared: Network {
        if instance == nil {
            instance = Network()
        }
        return instance!
    }

    static private var instance: Network?

    init() {
        session = URLSession.shared
    }

    func requestData(
        using request: Request,
        onComplete: @escaping (Result<Data, Error>) -> Void
    ) {

        guard let url = URL(string: Config.baseURL) else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue

        let datatask = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                onComplete(.failure(error))
                return
            }

            guard let response = response as? HTTPURLResponse else {
                let error = NSError(domain: "Response fail", code: 499, userInfo: nil)
                onComplete(.failure(error))
                return
            }

            guard response.statusCode >= 200 && response.statusCode < 300 else {
                let error = NSError(domain: "Unexpected fail", code: response.statusCode, userInfo: nil)
                onComplete(.failure(error))
                return
            }

            guard let data = data else {
                let error = NSError(domain: "No Data", code: response.statusCode, userInfo: nil)
                onComplete(.failure(error))
                return
            }

            onComplete(.success(data))

        }
        datatask.resume()

    }

    func request<T: Decodable>(
        request: Request,
        returning type: T.Type,
        onComplete: @escaping (Result<T?, Error>) -> Void
    ) {
        requestData(using: request) { result in
            switch result {
            case .failure(let error):
                onComplete(.failure(error))
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let object = try decoder.decode(type, from: data)
                    onComplete(.success(object))
                } catch {
                    onComplete(.failure(error))
                }
            }
        }
    }

}
