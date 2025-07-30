# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Main categories


# Main categories
electronics = Category.create!(name_en: "Electronics", name_bn: "ইলেকট্রনিক্স")
fashion = Category.create!(name_en: "Fashion", name_bn: "ফ্যাশন")
groceries = Category.create!(name_en: "Groceries", name_bn: "মুদির পণ্য")
home_living = Category.create!(name_en: "Home & Living", name_bn: "বাসা ও জীবিকা")
baby_kids = Category.create!(name_en: "Baby & Kids", name_bn: "শিশু ও বাচ্চা")
health_beauty = Category.create!(name_en: "Health & Beauty", name_bn: "স্বাস্থ্য ও সৌন্দর্য")
tools_hardware = Category.create!(name_en: "Tools & Hardware", name_bn: "যন্ত্রপাতি ও হার্ডওয়ার")
books_stationery = Category.create!(name_en: "Books & Stationery", name_bn: "বই ও স্টেশনারি")
sports_outdoors = Category.create!(name_en: "Sports & Outdoors", name_bn: "খেলাধুলা ও আউটডোর")

# Electronics subcategories
electronics.children.create!([
  { name_en: "Mobile Phones", name_bn: "মোবাইল ফোন" },
  { name_en: "Tablets", name_bn: "ট্যাবলেট" },
  { name_en: "Laptops & Computers", name_bn: "ল্যাপটপ ও কম্পিউটার" },
  { name_en: "TV & Home Entertainment", name_bn: "টিভি ও হোম এন্টারটেইনমেন্ট" },
  { name_en: "Camera & Accessories", name_bn: "ক্যামেরা ও আনুষঙ্গিক" },
  { name_en: "Smartwatches & Wearables", name_bn: "স্মার্টওয়াচ ও পরিধানযোগ্য" }
])

# Fashion subcategories
fashion_men = fashion.children.create!(name_en: "Men's Fashion", name_bn: "পুরুষদের ফ্যাশন")
fashion_women = fashion.children.create!(name_en: "Women's Fashion", name_bn: "নারীদের ফ্যাশন")
fashion_kids = fashion.children.create!(name_en: "Kids' Fashion", name_bn: "বাচ্চাদের ফ্যাশন")

fashion_men.children.create!([
  { name_en: "T-shirts & Polos", name_bn: "টি-শার্ট ও পোলো" },
  { name_en: "Panjabi & Kurta", name_bn: "পাঞ্জাবি ও কুর্তা" },
  { name_en: "Jeans & Pants", name_bn: "জিন্স ও প্যান্ট" },
  { name_en: "Shoes", name_bn: "জুতা" }
])

fashion_women.children.create!([
  { name_en: "Saree", name_bn: "শাড়ি" },
  { name_en: "Salwar Kameez", name_bn: "সালওয়ার কামিজ" },
  { name_en: "Kurtis & Tops", name_bn: "কুর্তি ও টপস" },
  { name_en: "Hijab & Scarves", name_bn: "হিজাব ও স্কার্ফ" },
  { name_en: "Women's Shoes", name_bn: "মহিলাদের জুতা" }
])

fashion_kids.children.create!([
  { name_en: "Boys’ Clothing", name_bn: "ছেলেদের পোশাক" },
  { name_en: "Girls’ Clothing", name_bn: "মেয়েদের পোশাক" },
  { name_en: "Kids’ Shoes", name_bn: "বাচ্চাদের জুতা" }
])

# Groceries subcategories
groceries.children.create!([
  { name_en: "Rice & Pulses", name_bn: "চাল ও ডাল" },
  { name_en: "Edible Oil", name_bn: "ভোজ্য তেল" },
  { name_en: "Spices & Masalas", name_bn: "মসলা" },
  { name_en: "Snacks & Beverages", name_bn: "নাস্তা ও পানীয়" },
  { name_en: "Bakery & Dairy", name_bn: "বেকারি ও দুগ্ধজাত" },
  { name_en: "Fruits & Vegetables", name_bn: "ফলমূল ও শাকসবজি" }
])

# Home & Living subcategories
home_living.children.create!([
  { name_en: "Kitchenware", name_bn: "রান্নার পণ্য" },
  { name_en: "Bedding & Bath", name_bn: "বিছানা ও বাথ" },
  { name_en: "Furniture", name_bn: "আসবাবপত্র" },
  { name_en: "Home Decor", name_bn: "ঘর সাজানোর সামগ্রী" },
  { name_en: "Lighting", name_bn: "লাইটিং" }
])

# Baby & Kids subcategories
baby_kids.children.create!([
  { name_en: "Diapers & Wipes", name_bn: "ডায়াপার ও ওয়াইপস" },
  { name_en: "Baby Food", name_bn: "শিশু খাদ্য" },
  { name_en: "Toys & Games", name_bn: "খেলনা ও গেম" },
  { name_en: "Baby Gear", name_bn: "শিশু সামগ্রী (স্ট্রলার, ক্যারিয়ার)" }
])

# Health & Beauty subcategories
health_beauty.children.create!([
  { name_en: "Skincare", name_bn: "ত্বকের যত্ন" },
  { name_en: "Makeup", name_bn: "মেকআপ" },
  { name_en: "Hair Care", name_bn: "চুলের যত্ন" },
  { name_en: "Personal Care", name_bn: "ব্যক্তিগত যত্ন" },
  { name_en: "Health Supplements", name_bn: "স্বাস্থ্য সাপ্লিমেন্ট" }
])

# Tools & Hardware subcategories
tools_hardware.children.create!([
  { name_en: "Hand Tools", name_bn: "হাতের যন্ত্রপাতি" },
  { name_en: "Power Tools", name_bn: "পাওয়ার টুলস" },
  { name_en: "Plumbing & Electrical", name_bn: "প্লাম্বিং ও ইলেকট্রিক্যাল" },
  { name_en: "Paint & Home Improvement", name_bn: "রং ও হোম ইম্প্রুভমেন্ট" }
])

# Books & Stationery subcategories
books_stationery.children.create!([
  { name_en: "Bangla Literature", name_bn: "বাংলা সাহিত্য" },
  { name_en: "English Literature", name_bn: "ইংরেজি সাহিত্য" },
  { name_en: "Children’s Books", name_bn: "শিশুদের বই" },
  { name_en: "Educational & Academic Books", name_bn: "শিক্ষা ও একাডেমিক বই" },
  { name_en: "Notebooks & Office Supplies", name_bn: "নোটবুক ও অফিস সামগ্রী" }
])

# Sports & Outdoors subcategories
sports_outdoors.children.create!([
  { name_en: "Sportswear", name_bn: "স্পোর্টসওয়্যার" },
  { name_en: "Exercise & Fitness Equipment", name_bn: "ব্যায়াম ও ফিটনেস যন্ত্রপাতি" },
  { name_en: "Bicycles & Accessories", name_bn: "সাইকেল ও আনুষঙ্গিক" },
  { name_en: "Outdoor Gear", name_bn: "আউটডোর গিয়ার" }
])
