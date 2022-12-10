//
//  Post.swift
//  Navigation
//
//  Created by Сергей Топильский on 17.08.2022.
//

import Foundation

struct Post {
    let author: String
    let description: String
    let image: String
    let likes: Int
    let views: Int
}

let arrayOfPosts: [Post] = [
    Post(author: "Анри Матисс", description: "Танец - год создания 1910", image: "Painting1", likes: 1950, views: 20000),
    Post(author: "Марк Захарович Шагал", description: "Пролетая над городом - год создания 1918", image: "Painting2", likes: 907, views: 1900),
    Post(author: "Винсент Ван Гог", description: "Звездная ночь - год создания 1889", image: "Painting3", likes: 12309, views: 70000),
    Post(author: "Каземир Малевич", description: "Голова крестьянина - год создания 1929", image: "Painting4", likes: 1950, views: 20000),
    Post(author: "Пабло Пикассо", description: "Девочка на шаре - год создания 1905", image: "Painting5", likes: 7, views: 15),
    Post(author: "Сальвадор Дали", description: "Постоянство памяти - год создания 1931", image: "Painting6", likes: 99999, views: 999999),
]
