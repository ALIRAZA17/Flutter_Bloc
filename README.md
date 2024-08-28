# flutter_bloc_test

A new Flutter project.


## Important Points related to Bloc

1) We use `Equatable` to compare instances of state just to check if the present state and previous state are same or different.
2) During the comparison, it not only checks the reference but also the values making it easy to compare.
3) UI --> Event --> Bloc --> State --> UI 

## Cubit vs Bloc
Cubit is more towards simple state changes where there are no events involved just state changes. It has much simpler syntax. Example of Cubit vs Bloc is shown below:

```Dart
// Counter Cubit
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
}

// Counter Bloc
sealed class CounterEvent {}
final class CounterIncrementPressed extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrementPressed>((event, emit) => emit(state + 1));
  }
}

```

But what is the advantage of Bloc then?

Well using bloc gives you more control over state management by allowing you to track events that caused the state change. For example, A common use case might be managing AuthenticationState. For simplicity, let’s say we can represent AuthenticationState via an enum:

```Dart
enum AuthenticationState { unknown, authenticated, unauthenticated }
```

There could be many reasons as to why the application’s state could change from authenticated to unauthenticated. For example, the user might have tapped a logout button and requested to be signed out of the application. On the other hand, maybe the user’s access token was revoked and they were forcefully logged out. When using Bloc we can clearly trace how the application state got to a certain state.

```Dart
Transition {
  currentState: AuthenticationState.authenticated,
  event: LogoutRequested,
  nextState: AuthenticationState.unauthenticated
}
```

The above Transition gives us all the information we need to understand why the state changed. If we had used a Cubit to manage the AuthenticationState, our logs would look like:

```Dart
Change {
  currentState: AuthenticationState.authenticated,
  nextState: AuthenticationState.unauthenticated
}
```
This tells us that the user was logged out but it doesn’t explain why which might be critical to debugging and understanding how the state of the application is changing over time.
