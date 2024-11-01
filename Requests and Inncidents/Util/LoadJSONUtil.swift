//
//  LoadJSONUtil.swift
//  Requests and Inncidents
//
//  Created by Sahal Hassan Nazar on 01/11/24.
//

import Foundation

func loadJSON<T: Codable>(from fileName: String) async throws -> [T] {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
        throw NSError(domain: "FileErrorDomain", code: 404, userInfo: [NSLocalizedDescriptionKey: "The JSON file \(fileName).json was not found."])
    }

    let data = try Data(contentsOf: url)
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .useDefaultKeys
    
    do {
        let response = try decoder.decode(GenericResponse<T>.self, from: data)
        
        guard let data = response.data else {
            throw NSError(domain: "DataErrorDomain", code: 204, userInfo: [NSLocalizedDescriptionKey: "No data found in \(fileName).json."])
        }
        
        return data
    } catch let DecodingError.dataCorrupted(context) {
        print("Data corrupted: \(context.debugDescription)")
        throw context.underlyingError ?? DecodingError.dataCorrupted(context)
    } catch let DecodingError.keyNotFound(key, context) {
        print("Key '\(key)' not found: \(context.debugDescription)")
        throw context.underlyingError ?? DecodingError.keyNotFound(key, context)
    } catch let DecodingError.typeMismatch(type, context) {
        print("Type '\(type)' mismatch: \(context.debugDescription)")
        throw context.underlyingError ?? DecodingError.typeMismatch(type, context)
    } catch let DecodingError.valueNotFound(value, context) {
        print("Value '\(value)' not found: \(context.debugDescription)")
        throw context.underlyingError ?? DecodingError.valueNotFound(value, context)
    } catch {
        print("Decoding error: \(error.localizedDescription)")
        throw error
    }
}
