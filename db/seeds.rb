# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
  admin = User.create(first_name: 'Admin', last_name: '', password: 'test12345', email: 'admin@rationalbits.com', role: 'admin')
  categories = QuestionCategory.create([{name: 'Physics', info: 'physics'}, {name: 'Chemistry', info: 'chemistry'}, {name: 'iOS', info: 'iPhone/iPad/Apple TV'}])
    
  question = Question.create(name: 'question 1', category_id: categories.first.id, questionText: 'Nuclear sizes are expressed in a unit named', qtype: 2, possible_values: 'Fermi|Newton|Tesla|Anstrom');
  QuestionAnswer.create(question: question, answer: 'Fermi')
  
  question = Question.create(name: 'question 2', category_id: categories.first.id, questionText: 'When light bends as it enters a different medium the process is known as what?', qtype: 0);
  QuestionAnswer.create(question: question, answer: 'Refraction')
  
  question = Question.create(name: 'question 3', category_id: categories.first.id, questionText: 'Iron is attracted by magnets.', qtype: 1, possible_values: 'TRUE/FALSE');
  QuestionAnswer.create(question: question, answer: 'TRUE')
