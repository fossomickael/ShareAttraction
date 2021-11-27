# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ShortLinkReferrer.destroy_all
ShortLinkPost.destroy_all
ShortLink.destroy_all
SlackChannel.destroy_all
Mention.destroy_all
PostReferrer.destroy_all
User.destroy_all
Attraction.destroy_all
Post.destroy_all

mike = User.create(email: "fosso.mickael@attraction.com", username:"fossomickael", password: "123456", bio: "An avid fan of Ruby. I like to share all my tips")
rene = User.create(email: "rene@hotmail.com", username:"rene", password: "123456", bio: "An avid fan of Ruby. I like to share all my tips")
emilie = User.create(email: "emi@gmail.com", username:"emilie", password: "123456", bio: "An avid fan of Ruby. I like to share all my tips")
isa = User.create(email: "isa@gmail.com", username:"isa", password: "123456", bio: "An avid fan of Ruby. I like to share all my tips")




growth_hacking = Attraction.create(name:"growthhacking", description: "An attraction group to grow your business")
ruby_is_cool = Attraction.create(name:"rubyiscool", description: "An attraction group for Ruby enthusiasts")
attraction_member = AttractionMember.create(user:mike, attraction:growth_hacking)
ruby_member = AttractionMember.create(user:mike, attraction:ruby_is_cool)
wedressyou = Attraction.create(name:"wedressyou", description: "An attraction group to grow your business")



ethical_fabrics = User.create(email: "al@fabrics.com", username:"ethical_fabrics", password: "123456", bio: "We sell ethical clothes. From Germany. Check out your website https://www.ethical-fabrics.com")
appolo = User.create(email: "al@apollo.com", username:"appolo_clothes", password: "123456", bio: "We sell ethical clothes. From France")
AttractionMember.create(user:ethical_fabrics, attraction: wedressyou)
AttractionMember.create(user:appolo, attraction: wedressyou)
AttractionMember.create(user:mike, attraction: wedressyou)
AttractionMember.create(user:emilie, attraction: wedressyou)

post_shop = Post.create(title:"Our online shop is finally open! ", user: mike, 
attraction: wedressyou ,content: "<p><a href='/users/#{emilie.id}'>@Emilie</a> helped us integrate Stripe, the most secure payment service avalaible on the market. 
This was the last step necessary to launch our online shopping store. We sell
ethical clothes from brands all over the world. We would like to thanks our 
partner brands <a href='/users/#{ethical_fabrics.id}'>@ethical_fabrics</a>,
<a href='/users/#{appolo.id}'>@appolo_clothes</a> who trusted us.</p>
<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum
deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non
provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et
dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore,
cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat
facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem
quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates
repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente 
delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus 
asperiores repellat.</p>
<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum
deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non
provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et
dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore,
cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat
facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem
quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates
repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente 
delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus 
asperiores repellat.</p>
<p>To celebrate we offer a coupon of 10% on the first order of 100 dollars!
Create a ShareAttraction account, share the link to one of your friends and receive a coupon of 20%! </p>")


appolo_dress_referrals = PostReferrer.create!(user: appolo, post: post_shop, count: 150)
emilie_dress_referrals = PostReferrer.create!(user: emilie, post: post_shop, count: 200)
ethical_fabrics_dress_referrals = PostReferrer.create!(user: ethical_fabrics, post: post_shop, count: 300)
rene_dress_referrals = PostReferrer.create!(user: rene, post: post_shop, count: 400)

mickael_is_mentionned_post = Post.create(title:"How to build an online shop with Ruby", user: emilie, 
attraction: ruby_is_cool ,content: "<p>When<a href='/users/#{mike.id}'>@fossomickael</a> told me about his
clothes shop idea, I said to myself it would be a very interestring technical challenge.</p>
<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium 
voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.</p>")


rob = User.create(email: "rob@gmail.com", username:"rob", password: "123456", bio: "Hacker")
ez_firewalls = User.create(email: "ez@firewalls.com", username:"ez_firewalls", password: "123456", bio: "We build easy to use robust firewalls")

best_shield = Attraction.create(name:"bestshield", description: "An attraction group to grow your business")

best_shield_rob = AttractionMember.create(user:rob, attraction: best_shield)
attraction_member = AttractionMember.create(user:ez_firewalls, attraction:best_shield)
post_shield = Post.create( title:"Our product is now available!", user: rob, attraction: best_shield ,content: "<p>We are glad today to announced our new product, developped with our long time partner 
<a href='/users/#{ez_firewalls.id}'>ez_firewalls</a></p>

<p>Using a revolutionnary technology that protects all IOT devices, it will bring a never seen protection to critical
industries, which are attacked every day by hackers</p>
 ")



attraction_member = AttractionMember.create(user:isa, attraction:growth_hacking)
post_adwords = Post.create( title:"Seven tips to get better Adwords Results", user: isa, attraction: growth_hacking ,content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. Duis semper. Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim. Pellentesque congue. Ut in risus volutpat libero pharetra tempor. Cras vestibulum bibendum augue. Praesent egestas leo in pede. Praesent blandit odio eu enim. Pellentesque sed dui ut augue blandit sodales. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam nibh. Mauris ac mauris sed pede pellentesque fermentum. Maecenas adipiscing ante non diam sodales hendrerit.
Ut velit mauris, egestas sed, gravida nec, ornare ut, mi. Aenean ut orci vel massa suscipit pulvinar. <a href='/users/#{emilie.id}'>@emilie</a>, <a href='/users/#{isa.id}'>@isa</a> Nulla sollicitudin. Fusce varius, ligula non tempus aliquam, nunc turpis ullamcorper nibh, in tempus sapien eros vitae ligula. Pellentesque rhoncus nunc et augue. Integer id felis. Curabitur aliquet pellentesque diam. Integer quis metus vitae elit lobortis egestas. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi vel erat non mauris convallis vehicula. Nulla et sapien. Integer tortor tellus, aliquam faucibus, convallis id, congue eu, quam. Mauris ullamcorper felis vitae erat. Proin feugiat, augue non elementum posuere, metus purus iaculis lectus, et tristique ligula justo vitae magna.
Aliquam convallis sollicitudin purus. Praesent aliquam, enim at fermentum mollis, ligula massa adipiscing nisl, ac euismod nibh nisl eu lectus. Fusce vulputate sem at sapien. Vivamus leo. Aliquam euismod libero eu enim. Nulla nec felis sed leo placerat imperdiet. Aenean suscipit nulla in justo. Suspendisse cursus rutrum augue. Nulla tincidunt tincidunt mi. Curabitur iaculis, lorem vel rhoncus faucibus, felis magna fermentum augue, et ultricies lacus lorem varius purus. Curabitur eu amet. ")

attraction_member = AttractionMember.create(user:emilie, attraction:growth_hacking)
post_seo = Post.create(title:"Why I use SEOBooster", user: emilie, attraction: growth_hacking ,content: "« Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. Duis semper. Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim. Pellentesque congue. Ut in risus volutpat libero pharetra tempor. Cras vestibulum bibendum augue. Praesent egestas leo in pede. Praesent blandit odio eu enim. Pellentesque sed dui ut augue blandit sodales. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam nibh. Mauris ac mauris sed pede pellentesque fermentum. Maecenas adipiscing ante non diam sodales hendrerit.
Ut velit mauris, egestas sed, gravida nec, ornare ut, mi. Aenean ut orci vel massa suscipit pulvinar. Nulla sollicitudin. Fusce varius, ligula non tempus aliquam, nunc turpis ullamcorper nibh, in tempus sapien eros vitae ligula. Pellentesque rhoncus nunc et augue. Integer id felis. Curabitur aliquet pellentesque diam. Integer quis metus vitae elit lobortis egestas. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi vel erat non mauris convallis vehicula. Nulla et sapien. Integer tortor tellus, aliquam faucibus, convallis id, congue eu, quam. Mauris ullamcorper felis vitae erat. Proin feugiat, augue non elementum posuere, metus purus iaculis lectus, et tristique ligula justo vitae magna.
Aliquam convallis sollicitudin purus. Praesent aliquam, enim at fermentum mollis, ligula massa adipiscing nisl, ac euismod nibh nisl eu lectus. <a href='/users/#{emilie.id}'>@emilie</a>, <a href='/users/#{isa.id}'>@isa</a> Fusce vulputate sem at sapien. Vivamus leo. Aliquam euismod libero eu enim. Nulla nec felis sed leo placerat imperdiet. Aenean suscipit nulla in justo. Suspendisse cursus rutrum augue. Nulla tincidunt tincidunt mi. Curabitur iaculis, lorem vel rhoncus faucibus, felis magna fermentum augue, et ultricies lacus lorem varius purus. Curabitur eu amet. »")



AttractionMember.create(user:rene, attraction:ruby_is_cool)
post_pundit = Post.create( title:"Why use Pundit for your API", user:rene, attraction: ruby_is_cool ,content: "« Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. Duis semper. Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim. Pellentesque congue. Ut in risus volutpat libero pharetra tempor. Cras vestibulum bibendum augue. Praesent egestas leo in pede. Praesent blandit odio eu enim. Pellentesque sed dui ut augue blandit sodales. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam nibh. Mauris ac mauris sed pede pellentesque fermentum. Maecenas adipiscing ante non diam sodales hendrerit.
Ut velit mauris, egestas sed, gravida nec, ornare ut, mi <a href='/users/#{emilie.id}'>@emilie</a>, <a href='/users/#{isa.id}'>@isa</a>. Aenean ut orci vel massa suscipit pulvinar. Nulla sollicitudin. Fusce varius, ligula non tempus aliquam, nunc turpis ullamcorper nibh, in tempus sapien eros vitae ligula. Pellentesque rhoncus nunc et augue. Integer id felis. Curabitur aliquet pellentesque diam. Integer quis metus vitae elit lobortis egestas. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi vel erat non mauris convallis vehicula. Nulla et sapien. Integer tortor tellus, aliquam faucibus, convallis id, congue eu, quam. Mauris ullamcorper felis vitae erat. Proin feugiat, augue non elementum posuere, metus purus iaculis lectus, et tristique ligula justo vitae magna.
Aliquam convallis sollicitudin purus. Praesent aliquam, enim at fermentum mollis, ligula massa adipiscing nisl, ac euismod nibh nisl eu lectus. Fusce vulputate sem at sapien. Vivamus leo. Aliquam euismod libero eu enim. Nulla nec felis sed leo placerat imperdiet. Aenean suscipit nulla in justo. Suspendisse cursus rutrum augue. Nulla tincidunt tincidunt mi. Curabitur iaculis, lorem vel rhoncus faucibus, felis magna fermentum augue, et ultricies lacus lorem varius purus. Curabitur eu amet. »")

post_programmers = Post.create(title:"Very good programmers", user:rene, attraction: ruby_is_cool ,content: "« Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. Duis semper. Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim. Pellentesque congue. Ut in risus volutpat libero pharetra tempor. Cras vestibulum bibendum augue. Praesent egestas leo in pede. Praesent blandit odio eu enim. Pellentesque sed dui ut augue blandit sodales. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam nibh. Mauris ac mauris sed pede pellentesque fermentum. Maecenas adipiscing ante non diam sodales hendrerit.
<a href='/users/#{emilie.id}'>@emilie</a>, <a href='/users/#{isa.id}'>@isa</a> Ut velit mauris, egestas sed, gravida nec, ornare ut, mi. Aenean ut orci vel massa suscipit pulvinar. Nulla sollicitudin. Fusce varius, ligula non tempus aliquam, nunc turpis ullamcorper nibh, in tempus sapien eros vitae ligula. Pellentesque rhoncus nunc et augue. Integer id felis. Curabitur aliquet pellentesque diam. Integer quis metus vitae elit lobortis egestas. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi vel erat non mauris convallis vehicula. Nulla et sapien. Integer tortor tellus, aliquam faucibus, convallis id, congue eu, quam. Mauris ullamcorper felis vitae erat. Proin feugiat, augue non elementum posuere, metus purus iaculis lectus, et tristique ligula justo vitae magna.
Aliquam convallis sollicitudin purus. Praesent aliquam, enim at fermentum mollis, ligula massa adipiscing nisl, ac euismod nibh nisl eu lectus. Fusce vulputate sem at sapien. Vivamus leo. Aliquam euismod libero eu enim. Nulla nec felis sed leo placerat imperdiet. Aenean suscipit nulla in justo. Suspendisse cursus rutrum augue. Nulla tincidunt tincidunt mi. Curabitur iaculis, lorem vel rhoncus faucibus, felis magna fermentum augue, et ultricies lacus lorem varius purus. Curabitur eu amet. »")

rene_referrals = PostReferrer.create!(user: rene, post: post_programmers, count: 1)
emilie_referrals = PostReferrer.create!(user: emilie, post: post_programmers, count: 1)
isa_referrals = PostReferrer.create!(user: isa, post: post_programmers, count: 1)

rene_referrals.count += 189
rene_referrals.save

emilie_referrals.count += 204
emilie_referrals.save

isa_referrals.count += 410
isa_referrals.save


