
# Pagination In Flutter with Bloc

you need to add these to the beginning of the bloc class as a global variable

```dart
  int _page = 1;
  // int _limit = 20;
  bool _hasNextPage = true;
  bool _isFirstLoadRunning = true;
  bool _isLoadMoreRunning = false;
  List<item_model> _items = [];

```


on requesting to load the items from the beginning

```dart 
   if (_isFirstLoadRunning == true) {
        _firstLoad();
   } else {
        _loadMore();
   }
```

### _firstLoad function

```dart 
   void _firstLoad() async {

      _isFirstLoadRunning = true;
      emit(//call the loading//);

      //get the items from server

      emit(//items to UI //);

      _isFirstLoadRunning = false;
   }
```

### _loadMore function

```dart 
   void _loadMore() async {
       if (_hasNextPage == true && _isLoadMoreRunning == false) {
         _isLoadMoreRunning = true;
         _page += 1;

         //load items from server
         _items.addAll(//newItems which are loaded from server// ?? []);

         if (_page >= //number of pages that are returned from server//) {
           _hasNextPage = false;
         }
         emit(//items to the server//);

         _isLoadMoreRunning = false;
       }
     }

```
    



### in your view page

```dart 
   final ScrollController _scrollController = ScrollController();
```   


add this line to init state

```dart 

_scrollController.addListener(scrollListener);

```
   

```dart 
   void scrollListener() {
       if (_scrollController.position.extentAfter < 500) {
            //call to proper event
       }
     }

    @override
     void dispose() {
       _scrollController.removeListener(scrollListener);
       super.dispose();
     }

```
add this property to your listview

```dart
   controller: _scrollController,
```