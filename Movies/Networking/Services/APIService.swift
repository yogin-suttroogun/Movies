//
//  APIService.swift
//  Movies
//
//  Created by Yogin Kumar Suttroogun on 2026-04-29.
//

import Foundation

protocol APIService: Sendable {
    func fetchFilms() async throws -> [Film]
    func fetchPerson(from urlString: String) async throws -> Person
}
