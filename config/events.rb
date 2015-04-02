WebsocketRails::EventMap.describe do
  namespace :mentions do
    subscribe :create, :to => Sockets::MentionController, :with_method => :create
  end
end
