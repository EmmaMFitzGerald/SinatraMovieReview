Review.destroy_all
User.destroy_all

user_1 = User.create(first_name: 'Emma', last_name: 'FitzGerald', email: 'emma@gmail.com', password: '1234')
user_2 = User.create(first_name: 'Nolan', last_name: 'Townsend', email: 'nolan@gmail.com', password: '5678')
user_3 = User.create(first_name: 'Sarah', last_name: 'Smith', email: 'smith@gmail.com', password: '3579')


Review.create(title: 'Bridesmaids', genre: 'Comedy', content:'Really funny movie!', user_id: user_1.id )
Review.create(title: 'Inside Man', genre: 'Thriller', content:'Unexpected ending', user_id: user_2.id)
Review.create(title: 'Incredibles', genre: 'Cartoon', content:'Suitable for children', user_id:user_3.id)

