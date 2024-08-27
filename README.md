# flutter_bloc_test

A new Flutter project.


## Important Points related to Bloc

1) We use `Equatable` to compare instances of state just to check if the present state and previous state are same or different.
2) During the comparison, it not only checks the reference but also the values making it easy to compare.
3) UI --> Event --> Bloc --> State --> UI 
