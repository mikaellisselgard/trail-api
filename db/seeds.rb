# frozen_string_literal: true

User.create(
  name: 'Demo User',
  email: 'demo_user@example.com',
  password: 'password'
)

Fish.create(species: 'PIKE')
Fish.create(species: 'PERCH')
Fish.create(species: 'ZANDER')

Mushroom.create(species: 'CHANTARELLE')
Mushroom.create(species: 'TRUFFLE')
Mushroom.create(species: 'AGARIC')
