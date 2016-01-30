# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine loop that does not support auto reloading.
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :opinion_handle

    def connect
      self.opinion_handle = cookies.signed[:opinion_handle]
    end
  end
end
