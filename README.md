# RecipePuppyApp

A simple app that allows the search for recipies using the RecipePuppyApi (http://www.recipepuppy.com/about/api/)

### Prerequisites

Having the latest version of XCode and having cocoapods.

### Installing

Install pods using the following command

```
pod install
```

## Tests

The project contains UITests for interface. 
Unit tests for modules presenter and interactor. Didn't test router as it's implementation is simple. It only acts as a bridge for navigation.
I would need to implement a Coordinator or NavigationManager to mock it.

Also tried to mantain each module code private only exposing its interface.

The view was tested using UITests.

Missing tests for Data layer as didn't have time to implement it.
Requisites for implementing unit tests correctly on Data layer:
  - Dependency injection. My idea was to implement it with Swinject.
  - For a matter of time I initialized dependencies inside some classes (only in Data layer).

Also missing integration tests with localStorage and network.

All interfaces are mocked using SwiftyMocky.

We could discuss on that.

### Architechture

For this project I used a simple protocol oriented VIPER implementation.
## Comments

For local storage used the FileManager, as the object and it's use case were simple.

TODO: For dependency injection my idea was to implement it with Swinject.

