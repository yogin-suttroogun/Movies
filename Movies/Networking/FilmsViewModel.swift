//
//  FilmsViewModel.swift
//  Movies
//
//  Created by Yogin Kumar Suttroogun on 2026-04-28.
//

import Foundation
import Observation



@Observable
class FilmsViewModel {
    enum State: Equatable {
        case idle
        case loading
        case loaded([Film])
        case error(String)
    }
    
    var state: State = .idle
    var films: [Film] = []
    var service: APIService
    
    init(service: APIService = DefaultAPIClient()) {
        self.service = service
    }
    
    func fetch() async {
        guard
            state == .idle
        else { return }
        
        state = .loading
        do {
            let films = try await service.fetchFilms()
            self.state = .loaded(films)
        } catch let error as APIError {
            self.state = .error(error.errorDescription ?? "Unknown error")
        } catch {
            self.state = .error("Unknown error")
        }
    }
}
