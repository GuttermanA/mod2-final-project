# Would You Rather?

Would You Rather? is a game of preferences, where the user chooses between two things of the same category. These categories range from famous cats to TV characters, and even some not-so-PG categories, like Cards Against Humanity cards, which are available only to those over the age of 18.

Upon answering a question, the app displays the statistics of what all users have selected when presented with the same two choices. Users also have the option of posting comments regarding a particular question.

## Installing
1. Clone repository from GitHub
2. Open terminal
3. Navigate to the repository directory
```
cd would-you-rather
```
4. Update and install required gems
```
bundle install
```
5. Set up database
```
rake db:migrate
rake db:seed
```
6. Start the Rails server
```
rails s
```
7. In browser, navigate to the url localhost:3000

## Adding More Questions
1. Add choices of the same category in a CSV file
2. Place in db/seeds directory
3. Seed data
```
rake db:seed
```

## Built With
* [Ruby on Rails](http://rubyonrails.org/) - web framework
* [Bootstrap](https://getbootstrap.com/) - frontend library

## Contributing
1. Fork repository [here](https://github.com/feihafferkamp/mod2-project)
2. Create new branch for your feature
```
git checkout -b my-new-feature
```
3. Add and commit your changes
```
git commit -am 'Add some feature'
```
4. Push to your branch
```
git push origin my-new-feature
```
5. Create new pull request


## Authors
* Fei Hafferkamp - [Github Profile](https://github.com/feihafferkamp)
* Alex Gutterman - [Github Profile](https://github.com/guttermana)
