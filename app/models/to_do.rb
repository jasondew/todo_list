class ToDo < ActiveRecord::Base
  include ActionView::Helpers::DateHelper

  validates_presence_of :description

  def to_s
    answer = description
    answer += " (due in #{time_ago_in_words due_on})" if due_on
    answer
  end

end
