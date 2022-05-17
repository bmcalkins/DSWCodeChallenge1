//
//  main.swift
//  DSWCodeChallenge
//
//  Created by Bradley Calkins on 5/16/22.
//

import Foundation

struct Main {

    init() {
        let inputArgs = CommandLine.arguments.dropFirst()

        guard let path = inputArgs.first else {
            fatalError("Missing input")
        }

        do {
            let contents = try String(contentsOfFile: path, encoding: .utf8)
            let report = ProductParser().parse(document: contents)
                print(report)
        }
            catch let error as NSError {
                print("Error: \(error)")
        }
    }

}

