
Forem::Post.class_eval do
  include PublicActivity::Model
    tracked only: [:create], owner: Proc.new{ |controller, model| controller.forem_user }
end
