# encoding: utf-8
1.upto(10) do |num|
  User.create!(:email => "user#{num}@example.com", :password => 'password', :password_confirmation => 'password')  
end

Statement.create(phrase: 'This person was driving when we were pairing.')
Statement.create(phrase: 'While we were working, this person was doing their best and giving 100% of their effort.')
Statement.create(phrase: 'This person was comfortable expressing themselves clearly and concisely.')
Statement.create(phrase: 'I would happily work with this person again and would recommend them to others.')
Statement.create(phrase: 'I benefitted technically from having this person on our pair/team.')
Statement.create(phrase: 'I felt respected and considered by this person.')
