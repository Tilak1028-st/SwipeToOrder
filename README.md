# Swipe to Order Button Animation

This SwiftUI project demonstrates a draggable button that users can swipe to place an order. The button updates its icon and text dynamically based on the swipe progress, providing visual feedback with smooth animations.

## Features

- Draggable button with dynamic icon and text
- Smooth `easeInOut` animations for a seamless user experience
- Action triggered when swipe reaches 70% of the total width
- Visual feedback for successful order placement

## Preview

![Swipe to Order Preview](https://github.com/user-attachments/assets/0186cad7-f524-4532-9413-8ecc05ee513a)

## Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/your-username/swipe-to-order-animation.git
    ```

2. Open the project in Xcode:
    ```bash
    cd swipe-to-order-animation
    open SwipeToOrder.xcodeproj
    ```

3. Build and run the project on the simulator or a physical device.

## How it Works

The draggable button is created using SwiftUI's `DragGesture` to capture the user's swipe gesture. The button's icon and text are updated dynamically based on the swipe progress. Smooth animations are applied to ensure a seamless user experience.

- **Drag Gesture**: The button responds to the user's drag gesture, updating its position based on the swipe.
- **Dynamic Icon and Text**: The button's icon changes from an arrow to a checkmark, and the text updates from "Swipe to Order" to "Thank You" when the swipe crosses the 70% threshold.
- **Smooth Animations**: `easeInOut` animations are used to ensure smooth transitions for both the icon and the text.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
