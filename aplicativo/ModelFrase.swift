//
//  PersonViewMode.swift
//  aplicativo
//
//  Created by userext on 23/05/23.
//

import SwiftUI

class PersonViewModel: ObservableObject{
    @Published var people: [Person] = []
    func shuffleOrder() {
        people.shuffle()
    }
    func reverseOrder() {
        people.reverse()
    }
    func removeLastPerson() {
        people.removeLast()
    }
    func removeFirstPerson() {
        people.removeFirst()
    }
    let peopleData = {
        Person(name:"Jon Snow",email: "jonsnow@gmail.com",phoneNumber: "9123762")
    }
}
