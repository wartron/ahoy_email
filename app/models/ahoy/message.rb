module Ahoy
  class Message < ActiveRecord::Base
    self.table_name = "ahoy_messages"

    belongs_to :user, AhoyEmail.belongs_to.merge(polymorphic: true)
    belongs_to :user_form, AhoyEmail.belongs_to.merge(polymorphic: true), :foreign_key => :user_form_id

    def mail
      Mail.new(self.content)
    end
  end
end
