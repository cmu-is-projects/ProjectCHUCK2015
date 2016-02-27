# 
# Referenced source: http://www.toptal.com/ruby-on-rails/build-dumb-refactor-smart-ruby-on-rails
#
module Activeable
  def self.included(base)
    base.scope :active, -> { base.where(active: true) }
    base.scope :inactive, -> { base.where(active: false) }
  end
  
  def make_active
    self.active = true
    self.save!
  end
  
  def make_inactive
    self.active = false
    self.save!
  end
end