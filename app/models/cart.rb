class Cart < ApplicationRecord
  has_many :users

  has_many :list_commands
  has_many :items, through: :list_commands

end




=begin
  une instance du model cart sera liée forcément à un user
  un user n'a qu'un seul cart

  un cart a contient plusieurs items (pour ce MVP, nous ferons
  en sorte qu'un utilisateur ne choisisse pas la quantité d'items
  qu'il commande, qui sera toujours de 1)

  un item pourra être ajouté dans plusieurs carts


======================


  Chaque utilisateur peut avoir un panier, qui permettra de savoir
  les items qu'il a ajoutés à son panier, avant de passer la commande.
  Il faudra donc pour ceci créer une table panier, qui sera liée aux
  users. Puis donner la possibilité aux utilisateurs authentifiés
  de pouvoir ajouter des items à son panier.
=end
