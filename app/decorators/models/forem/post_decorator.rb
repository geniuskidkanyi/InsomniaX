
Forem::Post.class_eval do
  include PublicActivity::Model
    tracked
end