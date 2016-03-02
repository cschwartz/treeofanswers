class Node < ApplicationRecord
  has_closure_tree

  belongs_to :user
end
