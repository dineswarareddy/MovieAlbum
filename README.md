# MovieAlbum
This iOS application will display list of movies and corresponding movie details. Used VIPER architecture to develop this application

# How To Run:

1. Clone the application from repository link https://github.com/dineswarareddy/MovieAlbum.git
2. Go to current working directory location in terminal  by executing `cd folderPath` command.
3. Do `pod install` to get required frameworks to run this app. (User Alamofire framework for API calls)
4. Run the application `(cmd + r)`

# What to expect: 
1. User can see list of movies on launching the app. Those movies will be represented by movie preview image, movie title and with movie brief description. 
2. User can select any movie from this list
3. Selected movie details will display in next screen, This screen will display below list of details.
    a. Movie preview Image.
    b. Movie Original Title.
    c. Released date.
    d. Movie Rating.
    e. Movie Overview.
4. User can save movie by selecting `save` from navigation tabbar.
5. User can see the saved movies list by selecting `saved items` under movie list screen.
6. By selecting `API Items` user can see back the movies which will retrieved from network call.
