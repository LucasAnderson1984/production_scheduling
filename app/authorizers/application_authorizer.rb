class ApplicationAuthorizer < Authority::Authorizer
 def self.default(adjective, user)
   user.has_role? :admin
 end

 def readable_by? (user)
   if user.has_role :admin
     true
   else
     false
   end
 end

end
