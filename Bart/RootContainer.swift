//
//  RootContainer.swift
//  Bart
//
//  Created by Jason Holmes on 2/8/16.
//  Copyright © 2016 Holmes. All rights reserved.
//

import Foundation
import Swinject

public class RootContainer {

    func doSomething() {
        let container = Container()
        container.register(Cat.self) { _ in Cat(name: "Mimi") }
        container.register(AnimalType.self) { r in
            r.resolve(Cat.self)!
        }

        container.register(PersonType.self) { r in
            PetOwner(pet: r.resolve(AnimalType.self)!)
        }

        let person = container.resolve(PersonType.self)!
        NSLog(person.play())


        let childContainer = Container(parent: container)
        container.register(Dog.self) { _ in Dog(name: "Athena") }
        container.register(AnimalType.self) { r in
            r.resolve(Dog.self)!
        }

        let anotherPerson = childContainer.resolve(PersonType.self)!
        NSLog(anotherPerson.play())
    }
}

protocol AnimalType {
    var name: String? { get set }
    func sound() -> String
}

class Cat: AnimalType {
    var name: String?

    init(name: String?) {
        self.name = name
    }

    func sound() -> String {
        return "Meow!"
    }
}

class Dog: AnimalType {
    var name: String?

    init(name: String?) {
        self.name = name
    }

    func sound() -> String {
        return "Bow wow!"
    }
}

protocol PersonType {
    func play() -> String
}

class PetOwner: PersonType {
    let pet: AnimalType

    init(pet: AnimalType) {
        self.pet = pet
    }

    func play() -> String {
        let name = pet.name ?? "someone"
        return "I'm playing with \(name). \(pet.sound())"
    }
}