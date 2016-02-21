
Forem::Post.class_eval do
  include PublicActivity::Model
    tracked
    tracked owner: Proc.new { |controller, model| controller.forem_user ? controller.forem_user : nil }
end