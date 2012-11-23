class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :status
  has_many :assignments
  has_many :users, :through => :assignments
  has_many :comments
  
  after_create :send_emails
  
  attr_accessible :category_id, :description, :namekey, :status_id, :title, :user_id, :id, :pic
  
  private
  
  def send_emails
    assignees = []
    i = 0
    
    self.assignments.each do |ass|
      assignees[i] = User.find(ass.user_id)
      i = i + 1
    end
    
    self.assignments.each do |ass|
      assigned = User.find(ass.user_id)
      Notifier.new_ticket_notification(assigned, self.user, self, assignees).deliver
    end
   # Notifier.new_ticket_notification(self.user, current_user, self, self.users)
  end
end
