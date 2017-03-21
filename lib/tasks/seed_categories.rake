task seed_categories: :environment do

  Category.create(name: 'Project', color: '#9c27b0')
  Category.create(name: 'Activity', color: '#ff9800')
  Category.create(name: 'Library', color: '#4caf50')
  Category.create(name: 'General', color: '#607d8b')

end
