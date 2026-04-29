//
//  MockAPIService.swift
//  Movies
//
//  Created by Yogin Kumar Suttroogun on 2026-04-29.
//

import Foundation

struct MockAPIService: APIService {
    
    private struct SampleData: Decodable {
        let films: [Film]
        let people: [Person]
    }
    
    private func loadSampleData() throws -> SampleData {
        guard
            let url = Bundle.main.url(forResource: "sampleData", withExtension: "json")
        else {
            throw APIError.invalidURL
        }
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(SampleData.self, from: data)
        } catch let error as DecodingError {
            throw APIError.decoding(error)
        } catch let error as URLError {
            throw APIError.networkError(error)
        }
    }
    
    //MARK: - Protocol conformance
    func fetchFilms() async throws -> [Film] {
        let data = try loadSampleData()
        return data.films
    }
    
    func fetchPerson(from urlString: String) async throws -> Person {
        let data = try loadSampleData()
        return data.people.first!
    }
    
    // MARK: - Preview/testing only
    func fetchFilm() -> Film {
        let data = try! loadSampleData()
        return data.films.first!
    }
}
