//
//  LocalDataManager.swift
//  RecipePuppyApp
//
//  Created by Rodrigo Nunes on 10/10/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

//sourcery: AutoMockable
protocol LocalDataManagerInterface {
    static func save <T:Encodable> (object: T, with fileName:String) throws
    static func load <T: Decodable> (fileName: String, type: T.Type) -> T?
    static func loadAll <T: Decodable> (type: T.Type) -> [T]
    static func delete(fileName: String) throws
}

struct LocalDataManager: LocalDataManagerInterface {
    static func save <T:Encodable> (object: T, with fileName:String) throws {
        let url = getDocumentDirectory().appendingPathComponent(fileName, isDirectory: false)
        do {
            let data = try JSONEncoder().encode(object)
            if FileManager.default.fileExists(atPath: url.path) {
                try FileManager.default.removeItem(at: url)
            }
            FileManager.default.createFile(atPath: url.path, contents: data, attributes: nil)
        } catch {
            throw(error)
        }
    }
    
    static func load <T: Decodable> (fileName: String, type: T.Type) -> T? {
        let url = getDocumentDirectory().appendingPathComponent(fileName, isDirectory: false)
        
        guard !FileManager.default.fileExists(atPath: url.path) else {
            return nil
        }
        
        if let data = FileManager.default.contents(atPath: url.path) {
            let model = try? JSONDecoder().decode(type, from: data)
            return model
        }
        
        return nil
    }
    
    static func loadAll <T: Decodable> (type: T.Type) -> [T] {
        let url = getDocumentDirectory()
        let files = try? FileManager.default.contentsOfDirectory(atPath: url.path)
        var modelObjects = [T]()
        
        files?.forEach { fileName in
            if let object = load(fileName: fileName, type: type) {
                modelObjects.append(object)
            }
        }
        return modelObjects
    }
    
    static func delete(fileName: String) throws {
        let url = getDocumentDirectory().appendingPathComponent(fileName, isDirectory: false)
        if FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.removeItem(at: url)
            } catch {
                throw(error)
            }
        }
    }
}

private extension LocalDataManager {
    static func getDocumentDirectory() -> URL {
        if let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            return url
        } else {
            fatalError("Unable to access directory")
        }
    }
}
