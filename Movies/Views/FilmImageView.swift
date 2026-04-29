//
//  FilmImageView.swift
//  Movies
//
//  Created by Yogin Kumar Suttroogun on 2026-04-29.
//

import SwiftUI

struct FilmImageView: View {
    let urlPath: URL?
    
    init(urlPath: String) {
        self.urlPath = URL(string: urlPath)
    }
    
    init(url: URL?) {
        self.urlPath = url
    }
    
    var body: some View {
        AsyncImage(url: urlPath) { phase in
            switch phase {
            case .empty:
                Color(white: 0.8)
                    .overlay {
                        ProgressView()
                            .controlSize(.large)
                    }
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
            case .failure(let error):
                Text("Could not get image")
            default:
                fatalError()
            }
        }
    }
}

#Preview("poster image") {
    let name = "posterImage"
    let url = AssetExtractor().createLocalUrl(forImageNamed: name)
//    FilmImageView(urlPath: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/npOnzAbLh6VOIu3naU5QaEcTepo.jpg")
    FilmImageView(url: url)
        .frame(height: 150)
}

#Preview("banner image") {
    let name = "bannerImage"
    let url = AssetExtractor().createLocalUrl(forImageNamed: name)
//    FilmImageView(urlPath: "https://image.tmdb.org/t/p/w533_and_h300_bestv2/3cyjYtLWCBE1uvWINHFsFnE8LUK.jpg")
    
    FilmImageView(url: url)
    .frame(height: 300)
}


class AssetExtractor {

    /// Retrieves (or creates should it be necessary) a temporary image's local URL on cache directory for testing purposes
    /// - Parameter name: image name retrieved from asset catalog
    /// - Parameter imageExtension: Image type. Defaults to `.jpg` kind
    /// - Returns: Resulting URL for named image
    func createLocalUrl(forImageNamed name: String, imageExtension: String = "jpg") -> URL? {
        let fileManager = FileManager.default

        guard let cacheDirectory = fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            print("Unable to access cache directory")
            return nil
        }

        let url = cacheDirectory.appendingPathComponent("\(name).\(imageExtension)")

        // If file doesn't exist, creates it
        guard fileManager.fileExists(atPath: url.path) else {
            // Bundle(for: Self.self) is used here instead of .main in order to work on test target as well
            guard let image = UIImage(named: name, in: Bundle(for: Self.self), with: nil),
                  let data = image.jpegData(compressionQuality: 1) else {
                print("Impossible to convert to jpg data")
                return nil
            }

            fileManager.createFile(atPath: url.path, contents: data, attributes: nil)
            return url
        }

        return url
    }

}
