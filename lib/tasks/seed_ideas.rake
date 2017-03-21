task seed_ideas: :environment do

  Idea.create(
    name: 'Ideas Site',
    body: 'A site to store all the crazy ideas i have!',
    tag_list: 'quick, simple',
    category: Category.find_by(machine_name: :project)
  )

end
