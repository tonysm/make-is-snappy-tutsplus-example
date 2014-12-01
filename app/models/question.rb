class Question < ActiveRecord::Base
  self.per_page = 3
  belongs_to :user

  validates :body, presence: true, length: { in: 10..255 }
  validates :solved, inclusion: { in: [true, false] }

  def self.unsolved(params)
      where(:solved => false).paginate(:page => params[:page]).order('created_at DESC')
  end
end
