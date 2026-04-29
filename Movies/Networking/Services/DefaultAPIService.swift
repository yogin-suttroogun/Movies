//
//  DefaultAPIService.swift
//  Movies
//
//  Created by Yogin Kumar Suttroogun on 2026-04-29.
//

import Foundation

struct DefaultAPIClient: APIService {
    
    func fetch<T: Decodable>(from urlString: String, type: T.Type) async throws -> T {
        guard
            let url = URL(string: urlString)
        else {
            throw APIError.invalidURL
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard
                let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode)
            else {
                throw APIError.invalidResponse
            }
            return try JSONDecoder().decode(type.self, from: data)
        } catch let error as DecodingError {
            throw APIError.decoding(error)
        } catch let error as URLError {
            throw APIError.networkError(error)
        }    }
    
    func fetchFilms() async throws -> [Film] {
        let url = "https://ghibliapi.vercel.app/films"
        return try await fetch(from: url, type: [Film].self)
    }
    
    func fetchPerson(from urlString: String) async throws -> Person {
        return try await fetch(from: urlString, type: Person.self)
    }
}

class AuthRepository {
    var token: String?
    
    // let service: AuthService
    
    func refresh() {
        // fetch and update token
        token = "new-token"
    }
}
