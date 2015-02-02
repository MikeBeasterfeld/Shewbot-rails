case Rails.env
when 'development'
  Api.delete_all
  IrcUser.delete_all
  Show.delete_all
  Title.delete_all
  Vote.delete_all
  Link.delete_all

  user1 = IrcUser.create(name: "testuser")
  user2 = IrcUser.create(name: "testuser2")
  user3 = IrcUser.create(name: "testuser3")
  user4 = IrcUser.create(name: "testuser4")

  show1 = Show.create(title: "show1", episode_number: 1)

  puts "#{show1}"

  show2 = Show.create(title: "show2", episode_number: 1)
  show3 = Show.create(title: "show3", episode_number: 1)

  title1 = show1.titles.create(title: "Title 1", irc_user_id: user1.id)
  title2 = show1.titles.create(title: "Title 2", irc_user_id: user2.id)
  title3 = show1.titles.create(title: "Title 3", irc_user_id: user3.id)
  title4 = show1.titles.create(title: "Title 4", irc_user_id: user4.id)
  title5 = show1.titles.create(title: "Title 5", irc_user_id: user1.id)

  title1.votes.create(voterip: "10.10.10.10")
  title2.votes.create(voterip: "10.10.10.10")
  title3.votes.create(voterip: "10.10.10.10")
  title4.votes.create(voterip: "10.10.10.10")
  title5.votes.create(voterip: "10.10.10.10")
  title1.votes.create(voterip: "10.10.10.11")
  title1.votes.create(voterip: "10.10.10.12")
  title1.votes.create(voterip: "10.10.10.13")

  title1 = show2.titles.create(title: "Title 1", irc_user_id: user1.id)
  title2 = show2.titles.create(title: "Title 2", irc_user_id: user2.id)
  title3 = show2.titles.create(title: "Title 3", irc_user_id: user3.id)
  title4 = show2.titles.create(title: "Title 4", irc_user_id: user4.id)
  title5 = show2.titles.create(title: "Title 5", irc_user_id: user1.id)

  title1.votes.create(voterip: "10.10.10.10")
  title2.votes.create(voterip: "10.10.10.10")
  title3.votes.create(voterip: "10.10.10.10")
  title4.votes.create(voterip: "10.10.10.10")
  title5.votes.create(voterip: "10.10.10.10")
  title1.votes.create(voterip: "10.10.10.11")
  title1.votes.create(voterip: "10.10.10.12")
  title1.votes.create(voterip: "10.10.10.13")

  title1 = show3.titles.create(title: "Title 1", irc_user_id: user1.id)
  title2 = show3.titles.create(title: "Title 2", irc_user_id: user2.id)
  title3 = show3.titles.create(title: "Title 3", irc_user_id: user3.id)
  title4 = show3.titles.create(title: "Title 4", irc_user_id: user4.id)
  title5 = show3.titles.create(title: "Title 5", irc_user_id: user1.id)

  title1.votes.create(voterip: "10.10.10.10")
  title2.votes.create(voterip: "10.10.10.10")
  title3.votes.create(voterip: "10.10.10.10")
  title4.votes.create(voterip: "10.10.10.10")
  title5.votes.create(voterip: "10.10.10.10")
  title1.votes.create(voterip: "10.10.10.11")
  title1.votes.create(voterip: "10.10.10.12")
  title1.votes.create(voterip: "10.10.10.13")

  show3.links.create(url: "http://5by5.tv", irc_user_id: user1.id)

  show3.questions.create(question: "How do I shot web?", irc_user_id: user1.id)

end

