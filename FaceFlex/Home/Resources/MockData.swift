//
//  MockData.swift
//  Club_Connect
//
//  Created by student on 25-04-2024.
//

import Foundation


import Foundation

struct MockData {
    static let shared = MockData()



    private let recommended: ListSection = {
        .recommended([
            ListItem(title: "THE GRAND FINALE OF SIH-2022", image: "image2"),
          //  ListItem(title: "JZakir Khan Live", image: "ZakirKhanLiive"),
            ListItem(title: "Zakir Khan Live", image: "image3"),
            ListItem(title: "Fisher Mumbai India", image: "FisherMumbaiIndia"),
            
           // ListItem(title: "JZakir Khan Live", image: "ZakirKhanLiive"),
            
])
    }()

    private let eventsThisWeek: ListSection = {
        .eventsThisWeek([
            ListItem(title: "JustDance", image: "JustDance"),
            ListItem(title: "Dog tooth Sneakers", image: "DogtoothSneakers"),
            ListItem(title: "JustDance", image: "JustDance"),
            ListItem(title: "Dog tooth Sneakers", image: "DogtoothSneakers"),
            ListItem(title: "JustDance", image: "JustDance"),
            ListItem(title: "Dog tooth Sneakers", image: "DogtoothSneakers"),
            

        ])
    }()

    var pageData: [ListSection] {
        return [ recommended]
    }
}
