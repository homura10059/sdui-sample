//
//  SectionView.swift
//  SduiSwift
//
//  Created by 大村勇人 on 2024/06/16.
//

import SwiftUI

struct SectionView: View {
    let section: Section
    var body: some View {
        switch section.componentType {
        case .topicCarousel:
            TopicCarouselView(section: section)
        case .topicTrending:
            TopicTrendingView(section: section)
        }
    }
}

struct TopicCarouselView: View {
    let section: Section
    var body: some View {
        HStack {
            Text(section.title)
            Text(section.componentType.rawValue)
        }.padding()
            .background(Color.blue)
            .foregroundStyle(.white)
    }
}

struct TopicTrendingView: View {
    let section: Section
    var body: some View {
        VStack {
            Text(section.title)
            Text(section.componentType.rawValue)
        }.padding()
            .background(Color.green)
            .foregroundStyle(.white)
    }
}


#Preview("topicCarousel") {
    SectionView(section: Section(title: "title", componentType: .topicCarousel))
}


#Preview("topicTrending") {
    SectionView(section: Section(title: "title", componentType: .topicTrending))
}
