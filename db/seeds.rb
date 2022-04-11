Game.destroy_all
User.destroy_all
Genre.destroy_all


users = User.create! [
                       { name: 'Joe', email: 'abc123@gmail.com',password: 'abc123' },
                       { name: 'Amy', email: '123abcd@gmail.com', password: '123abc' },
                        { name: 'Bill', email: 'abc1234@gmail.com',password: 'abc123' },
                       { name: 'Jim', email: '123abc@gmail.com', password: '123abc' }

                     ]



Game.create! [
               { title: 'Dauntless', genre: 'MMORPG', platform: 'PC', short_description: 'A free-to-play, co-op action RPG with gameplay similar to Monster Hunter.', user_id: users.sample.id },
               { title: 'World of Tanks', genre: 'Shooter', platform: 'PC', short_description: 'If you like blowing up tanks, with a quick and intense game style you will love this game!', user_id: users.sample.id },
               { title: 'Warframe', genre: 'Shooter',platform: 'PC', short_description: 'A cooperative free-to-play third person online action shooter set in an stunning sci-fi world.', user_id: users.sample.id },
               { title: 'CRSED: F.O.A.D.', genre: 'Shooter', platform: 'PC', short_description: 'Take the battle royale genre and add  mystical powers and you have CRSED: F.O.A.D. (Aka Cuisine Royale: Second Edition)',  user_id: users.sample.id },
               { title: 'Crossout', genre: 'Shooter', platform: 'PC', short_description: 'A post-apocalyptic MMO vehicle combat game!', user_id: users.sample.id }
             ]

eloquent = Game.find_by title: 'Dauntless'
eloquent.notes.create! [
                         { title: "Great game to play",score: '5', note: "Great game to play" },
                         { title: "A bit disappointed",score: '4', note: 'The music does put you to sleep' }
                       ]

# Genre.create! [
#                { name: 'MMORPG' },
#                { name: 'Shooter' },
#                { name: 'Strategy'},
#                { name: 'Card'}
#                ]

# PersonalInfo.create! [
#                 { age: 18, country: 'China', phone: '123456123', twitter: '@meeee', user_id: users.sample.id },
#                 { age: 20, country: 'India', phone: '223456123', twitter: '@yow2', user_id: users.sample.id },
#                 { age: 25, country: 'Canada', phone: '4123456123', twitter: '@giew23', user_id: users.sample.id},
#                 { age: 30, country: 'America', phone: '143456123', twitter: '@pgihklj4', user_id: users.sample.id}
#               ]

Joe = User.find_by name: 'Joe'
Jim = User.find_by name: 'Jim'
Amy = User.find_by name: 'Amy'
Bill = User.find_by name: 'Bill'

MMORPG = Genre.create name: 'MMORPG'
Shooter = Genre.create name: 'Shooter'
Strategy = Genre.create name: 'Strategy'
Card = Genre.create name: 'Card'

Joe.genres << MMORPG
Joe.genres << Shooter
Joe.genres << Strategy
Joe.genres << Card

Jim.genres << MMORPG
Jim.genres << Shooter
Jim.genres << Strategy

Amy.genres << MMORPG
Amy.genres << Strategy
Amy.genres << Card

Bill.genres << Shooter
Bill.genres << Strategy
Bill.genres << Card
