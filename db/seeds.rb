# db/seeds.rb

# Limpiar usuarios existentes (opcional, útil en desarrollo)
User.destroy_all

puts "Creating users..."

# Crear un único admin
User.create!(
  email: "admin@example.com",
  password: "password123",
  password_confirmation: "password123",
  role: :admin
)

# Crear varios usuarios regulares de prueba
5.times do |i|
  User.create!(
    email: "user#{i+1}@example.com",
    password: "password123",
    password_confirmation: "password123",
    role: :regular
  )
end

puts "✅ Created 1 admin and 5 regular users."
