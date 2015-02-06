class TodoItem < ActiveRecord::Base
  belongs_to :todo_list

  validates :content, presence: true,
                      length: { minimum: 2 }

  # Two different ways of writing basically same thing,
  # in the later one, rails will write in the style of the first.
  scope :complete, -> { where("completed_at is not null") }
  scope :incomplete, -> { where(completed_at: nil) }

  def complete?
    !completed_at.blank?
  end
end
