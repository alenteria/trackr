ActionMailer::Base.smtp_settings = {  
     :address              => "smtp.gmail.com",  
     :port                 => 587,  
     :domain               => "clickinglabs.com",  
     :user_name            => "clicking.labs.ticketing", #Your user name
     :password             => "asdf@1234", # Your password
     :authentication       => "plain",  
     :enable_starttls_auto => true  
  }