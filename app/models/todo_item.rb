class TodoItem < ActiveRecord::Base
  belongs_to :todo_list

  validates :content, presence: true,
                      length: { minimum: 2 }

  def complete?
    !completed_at.blank?
  end
end
