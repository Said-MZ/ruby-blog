class Comment < ApplicationRecord
  include Visible

  belongs_to :article

  validates :commenter, presence: true
  validates :body, presence: true

  # Set default status to public
  after_initialize :set_default_status, if: :new_record?

  private

  def set_default_status
    self.status ||= "public"
  end
end
