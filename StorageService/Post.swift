//
//  Post.swift
//  Navigation
//
//  Created by Сергей Топильский on 17.08.2022.
//

import Foundation

public struct Post {
    public let author: String
    public let description: String
    public let image: String
    public let likes: Int
    public let views: Int

    public init(
        author: String,
        description: String,
        image: String,
        likes: Int,
        views: Int) {
            self.author = author
            self.description = description
            self.image = image
            self.likes = likes
            self.views = views
        }
}

public let arrayOfPosts: [Post] = [
    Post(author: "Анри Матисс", description: "Танец - год создания 1910", image: "Painting1", likes: 1950, views: 20000),
    Post(author: "Марк Захарович Шагал", description: "Пролетая над городом - год создания 1918", image: "Painting2", likes: 907, views: 1900),
    Post(author: "Винсент Ван Гог", description: "Звездная ночь - год создания 1889", image: "Painting3", likes: 12309, views: 70000),
    Post(author: "Каземир Малевич", description: "Голова крестьянина - год создания 1929", image: "Painting4", likes: 1950, views: 20000),
    Post(author: "Пабло Пикассо", description: "Девочка на шаре - год создания 1905", image: "Painting5", likes: 7, views: 15),
    Post(author: "Сальвадор Дали", description: "Постоянство памяти - год создания 1931", image: "Painting6", likes: 99999, views: 999999),
]

