# Spotlights
A library to focus on view items as introduction your app behavior.

Inspired by Android repo [Spotlight](https://github.com/TakuSemba/Spotlight)

## Install

Support Cocoapods

```
pod 'Spotlights', :git => 'https://github.com/ngominhtrint/Spotlights.git'

# or

pod 'Spotlights'
```

Then, for terminal

```
pod install
```

## Usage

#### Build a single target

- Create first target as Rectangle shape & apply on numberOneLabel.
- Use FirstOverlay (customize view by xib) as overlay view.

```
    let firstTarget = TargetBuilder()
      .setAnchor(view: numberOneLabel)
      .setShape(shape: Rectangle(width: 100, height: 40, cornerRadius: 8.0))
      .setOverlay(overlay: firstOverlay)
      .setDelegate(delegate: self)
      .build()
```

- Note: we're also able to create a Square shape without corner radius

```
	Rectangle(width: 100, height: 100)
```

#### Create sample overlay with 3 buttons: prev, next & stop spotlight

```
// Create sample overlay view
    let overlay = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    overlay.addSubview(prevButton)
    overlay.addSubview(nextButton)
    overlay.addSubview(stopSpotlightButton)
```

#### Build another targets as Circle shape with different radius

- Create second target as Circle shape & apply on numberTwoLabel.

```
    let secondTarget = TargetBuilder()
      .setAnchor(view: numberTwoLabel)
      .setShape(shape: Circle(radius: 40))
      .setOverlay(overlay: overlay)
      .setDelegate(delegate: self)
      .build()
```

- Create third target as Circle shape & apply on numberThreeLabel.

```
    let thirdTarget = TargetBuilder()
      .setAnchor(view: numberThreeLabel)
      .setShape(shape: Circle(radius: 80))
      .setOverlay(overlay: overlay)
      .setDelegate(delegate: self)
      .build()
```

#### Build spotlight for these 3 targets above

- Create spotlight with an array of targets.
- Set container as current UIViewController.

```
    spotlight = SpotlightBuilder()
      .setTargets(targets: [firstTarget, secondTarget, thirdTarget])
      .setContainer(container: self)
      .setSpotlightDelegate(delegate: self)
      .build()

```

#### Start spotlight

// After all, don't forget to start spotlight

```
   spotlight.start()
```

#### Target Delegate

- To listen `didTargetStart` and `didTargetEnd` target events.

```
   func didTargetStart(target: Target, index: Int)
  
   func didTargetEnd(target: Target, index: Int)
```

- Conform target delegate.

```
extension ViewController: TargetDelegate {
  func didTargetStart(target: Target, index: Int) {
    print("TargetDelegate didTargetStart, index: \(index)")
  }
  
  func didTargetEnd(target: Target, index: Int) {
    print("TargetDelegate didTargetEnd, index: \(index)")
  }
}
```

#### Spotlights Delegate

- To listen `didStart` and `didEnd` spotlight events.

```
  func didStart(spotlight: Spotlight)
  
  func didEnd(spotlight: Spotlight)
```

- Conform spotlight delegate.

```
extension ViewController: SpotlightDelegate {
  func didStart(spotlight: Spotlight) {
    print("SpotlightDelegate didStart")
  }
  
  func didEnd(spotlight: Spotlight) {
    print("SpotlightDelegate didEnd")
  }
}
```

#### Control target

```
\\ Start a spotlight
spotlight.start()

\\ Finish a spotlight
spotlight.finish()

\\ Go to the next target
spotlight.next()

\\ Go to the previous target
spotlight.previous()

```

**Note:** Find the full usage source inside [ViewController.swift](https://github.com/ngominhtrint/Spotlights/blob/master/SpotlightsDemo/ViewController.swift)

## Advance Usage

#### Create a bunch of similar property targets & apply on all views

```
let targets = [numberOneLabel, numberTwoLabel, numberThreeLabel].map {
      return TargetBuilder()
        .setAnchor(view: $0)
        .setShape(shape: Circle(radius: 80))
        .setOverlay(overlay: overlay)
        .setDelegate(delegate: self)
        .build()
    }

spotlight = SpotlightBuilder()
    .setTargets(targets: targets)
    .setContainer(container: self)
    .setSpotlightDelegate(delegate: self)
    .build()
```

### Create different overlay view for each target.

- Reference to [FirstOverlay.swift](https://github.com/ngominhtrint/Spotlights/blob/master/SpotlightsDemo/FirstOverlay.swift)

## Video Walkthrough

<img src="media/spotlights.mov" alt="spotlights demo" style="width:200px;"/>

## Contribution

- Welcome everyone to contribute, review and point out my bad. 

## Licence

```
Copyright 2020 Rover Dream.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```