# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

def open_image(file_name)
  Magick::Image.read(Rails.root.join('db', 'seed_assets', file_name))[0]
end

# Only run on development (local) instances not on production, etc.
# unless Rails.env.development?
#   puts "Development seeds only (for now)!"
#   exit 0
# end

# Let's do this ...

## CATEGORIES

puts "Finding or Creating Categories ..."

cat1 = Category.find_or_create_by! name: 'Apparel'
cat2 = Category.find_or_create_by! name: 'Electronics'
cat3 = Category.find_or_create_by! name: 'Furniture'

## PRODUCTS

puts "Re-creating Products ..."

Product.destroy_all

# pry.binding

cat1.products.create!({
  name:  'Men\'s Classy shirt',
  description: Faker::Hipster.paragraph(4),
  img_url: 'http://res.cloudinary.com/dc4jkh9o8/image/upload/v1522715553/ij0uah8gf1myrfwvwnlp.jpg',
  quantity: 10,
  price: 64.99
})


cat1.products.create!({
  name:  'Women\'s Zebra pants',
  description: Faker::Hipster.paragraph(4),
  img_url: 'http://res.cloudinary.com/dc4jkh9o8/image/upload/v1522715554/lpzlbedvuf86ajxuwpca.jpg',
  quantity: 18,
  price: 124.99
})

cat1.products.create!({
  name:  'Hipster Hat',
  description: Faker::Hipster.paragraph(4),
  img_url: 'http://res.cloudinary.com/dc4jkh9o8/image/upload/v1522715555/xij2kufedjwp3ck2ydea.jpg',
  quantity: 4,
  price: 34.49
})

cat1.products.create!({
  name:  'Hipster Socks',
  description: Faker::Hipster.paragraph(4),
  img_url: 'http://res.cloudinary.com/dc4jkh9o8/image/upload/v1522715555/qkeuw0ynxvefieulblya.jpg',
  quantity: 8,
  price: 25.00
})

cat1.products.create!({
  name:  'Russian Spy Shoes',
  description: Faker::Hipster.paragraph(4),
  img_url: 'http://res.cloudinary.com/dc4jkh9o8/image/upload/v1522715557/cdtddnjbq4bswkkujdvb.jpg',
  quantity: 8,
  price: 1_225.00
})

cat1.products.create!({
  name:  'Human Feet Shoes',
  description: Faker::Hipster.paragraph(4),
  img_url: 'http://res.cloudinary.com/dc4jkh9o8/image/upload/v1522715557/jvawvbywxdfwnlz0gn9z.jpg',
  quantity: 82,
  price: 224.50
})


cat2.products.create!({
  name:  'Modern Skateboards',
  description: Faker::Hipster.paragraph(4),
  img_url: 'http://res.cloudinary.com/dc4jkh9o8/image/upload/v1522715558/hej3huqdtrr5jaatdhww.jpg',
  quantity: 40,
  price: 164.49
})

cat2.products.create!({
  name:  'Hotdog Slicer',
  description: Faker::Hipster.paragraph(4),
  img_url: 'http://res.cloudinary.com/dc4jkh9o8/image/upload/v1522715558/ihvrsfbgxgd7fey9zdmt.jpg',
  quantity: 3,
  price: 26.00
})

cat2.products.create!({
  name:  'World\'s Largest Smartwatch',
  description: Faker::Hipster.paragraph(4),
  img_url: 'http://res.cloudinary.com/dc4jkh9o8/image/upload/v1522715559/zeq8jloyowgfae0d0uap.jpg',
  quantity: 32,
  price: 2_026.29
})

cat3.products.create!({
  name:  'Optimal Sleeping Bed',
  description: Faker::Hipster.paragraph(4),
  img_url: 'http://res.cloudinary.com/dc4jkh9o8/image/upload/v1522715560/jbqoahewxc8mngpg3wit.jpg',
  quantity: 320,
  price: 3_052.00
})

cat3.products.create!({
  name:  'Electric Chair',
  description: Faker::Hipster.paragraph(4),
  img_url: 'http://res.cloudinary.com/dc4jkh9o8/image/upload/v1522715560/edezh01ppjmlih1wqn9g.jpg',
  quantity: 2,
  price: 987.65
})

cat3.products.create!({
  name:  'Red Bookshelf',
  description: Faker::Hipster.paragraph(4),
  img_url: 'http://res.cloudinary.com/dc4jkh9o8/image/upload/v1522715561/cyhkkzwm8eohbkwi38rs.jpg',
  quantity: 23,
  price: 2_483.75
})

cat3.products.create!({
  name:  'Metalic Sofa',
  description: Faker::Hipster.paragraph(4),
  img_url: 'http://res.cloudinary.com/dc4jkh9o8/image/upload/v1522715561/qsxuodfyk8wwefjzrztd.jpg',
  quantity: 0,
  price: 10_111.25
})

# We'll create some fake users and reviews...
products = Product.all

0.upto(10) do |i| 
  user = User.create!({
    name: Faker::Name.first_name,
    email: Faker::Internet.email,
    password_digest: (0...50).map { ('a'..'z').to_a[rand(26)] }.join
  })
  0.upto(3) do |j|
    user.reviews.create!({
      product_id: products.sample.id,
      rating: rand(6),
      description: Faker::Hipster.paragraph(2)
    })
  end
end


puts "DONE!"
