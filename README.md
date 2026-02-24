Flutter Layout & Structure

How Column, Center, and ConstrainedBox create a clean, centered layout

Why SingleChildScrollView prevents overflow on long pages

How Wrap automatically adjusts skill items on smaller screens

How to build a responsive interface without breaking large screens

Custom Graphics with CustomPainter

How to draw hundreds of stars manually on a canvas

How to store star properties using a model class instead of Offsets

Randomizing each star’s size, opacity, and movement values

Using mathematical rotation (sin/cos) to rotate the starfield

Simulating tilted-axis rotation to create a 3D galaxy effect

Updating the canvas every frame using CustomPainter + AnimationController

Animation & Stateful Logic

Why the starfield requires a StatefulWidget

How to use AnimationController for continuous updates

How to safely initialize and dispose of animation controllers

How to structure animation logic cleanly (generate, move, rotate)

Avoiding mistakes like:

putting build() in the wrong class

defining functions inside initState

rebuilding the entire UI unnecessarily

Creating Reusable UI Components

Building reusable SkillItem and ProjectCard widgets

Keeping consistent styling across multiple UI sections

Cleaning up UI by separating logical components

Working With Custom Fonts & Neon Theme

Adding custom fonts (Press Start 2P) through pubspec.yaml

Dealing with strict YAML indentation rules

Restarting the app when new fonts or assets are added

Designing a neon green retro-gaming color palette

Applying global typography using ThemeData and textTheme

Asset Management

Creating and organizing assets/ and fonts/ folders properly

Understanding how Flutter loads assets

Avoiding common issues like:

wrong asset paths

missing indentation

nested asset folders

hot reload not loading fonts

Code Architecture & Clean Practices

Structuring the app so logic stays in State classes

Separating animation code from UI code

Using helper methods like generateStars() and moveStars()

Keeping build() clean and readable

Ensuring widgets remain single-purpose and reusable
