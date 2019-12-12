class AddFeedbackToSchedule < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :feedback, :string
  end
end
