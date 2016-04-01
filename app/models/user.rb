class User < ActiveRecord::Base
# #2 we register an inline callback directly after the before_save     
   before_save { self.email = email.downcase }
   before_save :format_name

 # #3 we use Ruby's validates function to ensure that name is present and has a maximum and minimum length.
   validates :name, length: { minimum: 1, maximum: 100 }, presence: true
 # #4 we validate password with two separate validations: password_digest is nil and second: password is six xharacters long
  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true
 # #5 we validate that email is present, unique, case insensitive, has a minimum length, has a maximum length
  validates :email,
             presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 3, maximum: 254 }

 # #6 we use Ruby's has_secure_password
   has_secure_password
   
   def format_name
      if name
        name_array = []
        name.split.each do |name_part|
          name_array << name_part.capitalize
        end
        
        self.name = name_array.join(" ")
      end
   end
end
