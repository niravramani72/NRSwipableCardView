# NRSwipableCardView

NRSwipableCardView is a SwiftUI package for displaying customizable swipable card views, similar to those in dating apps. It supports swipe gestures and allows you to define actions for swiping left and right.

## Features

- **Swipable Cards**: Swipe left or right to trigger actions.
- **Customizable**: Set card images, text, and colors dynamically.
- **Smooth Animations**: Enjoy smooth swipe animations with feedback.

## Installation

You can add NRSwipableCardView to your project using Swift Package Manager.

### Adding the Package

1. Open your Xcode project.
2. Go to **File > Swift Packages > Add Package Dependency**.
3. Enter the URL of the package repository: https://github.com/your-username/SwipableCardPackage.git

4. Choose the version you want to use and click **Add Package**.

## Usage

### Import the Package

In your SwiftUI views, import the package:

```swift
import SwipableCardPackage
```

## Create Card Data
Define your cards with the desired properties:

```swift
let cards: [Card] = [
    Card(imageName: "image1", name: "John Doe", backgroundColor: .blue, textColor: .white),
    Card(imageName: "image2", name: "Jane Smith", backgroundColor: .green, textColor: .black),
    Card(imageName: "image3", name: "Alice Johnson", backgroundColor: .red, textColor: .yellow)
]
```
## Display Cards
Use CardStackView to display the stack of cards:

```swift
import SwiftUI
import SwipableCardPackage

struct ContentView: View {
    private let sampleCards: [Card] = [
        Card(imageName: "image1", name: "John Doe", backgroundColor: .blue, textColor: .white),
        Card(imageName: "image2", name: "Jane Smith", backgroundColor: .green, textColor: .black),
        Card(imageName: "image3", name: "Alice Johnson", backgroundColor: .red, textColor: .yellow)
    ]
    
    var body: some View {
        CardStackView(cards: sampleCards)
            .padding()
    }
}
```

## Customize Swipe Actions
Define actions for swiping left and right:

```swift
import SwiftUI

struct ContentView: View {
    private let sampleCards: [Card] = [
        Card(imageName: "image1", name: "John Doe", backgroundColor: .blue, textColor: .white),
        Card(imageName: "image2", name: "Jane Smith", backgroundColor: .green, textColor: .black),
        Card(imageName: "image3", name: "Alice Johnson", backgroundColor: .red, textColor: .yellow)
    ]
    
    var body: some View {
        CardStackView(cards: sampleCards)
            .onSwipeLeft { card in
                print("Swiped left on \(card.name)")
            }
            .onSwipeRight { card in
                print("Swiped right on \(card.name)")
            }
            .padding()
    }
}
```

## Contributing

Feel free to open issues or submit pull requests if you have suggestions or improvements. Contributions are welcome!

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---
