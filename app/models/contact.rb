class Contact < ApplicationRecord
  paginates_per 500
  has_one_attached :avatar

  validates :name, :email, presence: true

  def self.filters(params={})
    records = all

    if params[:since].present?
      since = DateTime.parse(params[:since])
      records = records.where("updated_at > ?", since)
    end

    records
  end
end
