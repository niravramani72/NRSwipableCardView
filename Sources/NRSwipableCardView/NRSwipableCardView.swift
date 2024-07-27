// The Swift Programming Language
// https://docs.swift.org/swift-book
import SwiftUI

public struct Card: Identifiable {
    public let id = UUID()
    public let imageName: String
    public let name: String
    public let backgroundColor: Color
    public let textColor: Color
    
    public init(imageName: String, name: String, backgroundColor: Color, textColor: Color) {
        self.imageName = imageName
        self.name = name
        self.backgroundColor = backgroundColor
        self.textColor = textColor
    }
}

public struct CardView: View {
    public var card: Card
    
    public init(card: Card) {
        self.card = card
    }
    
    public var body: some View {
        VStack {
            Image(card.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 400)
                .clipped()
            Text(card.name)
                .font(.largeTitle)
                .foregroundColor(card.textColor)
                .padding()
        }
        .background(card.backgroundColor)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

public struct SwipableCardView: View {
    @State private var offset: CGSize = .zero
    @State private var dragAmount: CGSize = .zero
    @State private var rotation: Double = 0
    
    public let card: Card
    public let onSwipeLeft: () -> Void
    public let onSwipeRight: () -> Void

    public init(card: Card, onSwipeLeft: @escaping () -> Void, onSwipeRight: @escaping () -> Void) {
        self.card = card
        self.onSwipeLeft = onSwipeLeft
        self.onSwipeRight = onSwipeRight
    }

    public var body: some View {
        CardView(card: card)
            .offset(x: offset.width + dragAmount.width, y: offset.height + dragAmount.height)
            .rotationEffect(.degrees(rotation))
            .gesture(
                DragGesture()
                    .onChanged { value in
                        dragAmount = value.translation
                        rotation = Double(value.translation.width / 10)
                    }
                    .onEnded { value in
                        withAnimation {
                            if abs(value.translation.width) > 100 {
                                if value.translation.width > 0 {
                                    // Swipe right
                                    onSwipeRight()
                                } else {
                                    // Swipe left
                                    onSwipeLeft()
                                }
                                offset = CGSize(width: value.translation.width, height: value.translation.height)
                            } else {
                                // Snap back
                                offset = .zero
                                dragAmount = .zero
                                rotation = 0
                            }
                        }
                    }
            )
            .animation(.spring(), value: offset)
    }
}

public struct CardStackView: View {
    @State private var cards: [Card] = []
    
    public init(cards: [Card]) {
        self._cards = State(initialValue: cards)
    }
    
    public var body: some View {
        ZStack {
            ForEach(cards.reversed()) { card in
                SwipableCardView(card: card,
                                 onSwipeLeft: { handleSwipeLeft(for: card) },
                                 onSwipeRight: { handleSwipeRight(for: card) })
                    .frame(width: 300, height: 400)
                    .padding()
            }
        }
    }
    
    private func handleSwipeLeft(for card: Card) {
        // Action for swipe left
        print("Swiped left on \(card.name)")
        removeCard(card)
    }
    
    private func handleSwipeRight(for card: Card) {
        // Action for swipe right
        print("Swiped right on \(card.name)")
        removeCard(card)
    }
    
    private func removeCard(_ card: Card) {
        if let index = cards.firstIndex(where: { $0.id == card.id }) {
            cards.remove(at: index)
        }
    }
}
