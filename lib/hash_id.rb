module HashId
  extend ActiveSupport::Concern

  included do
    validates :hash_id, uniqueness: true

    before_validation :create_hash_id

    def to_param
      hash_id
    end

    private

    def create_hash_id
      self.hash_id = SecureRandom.hex.first(7) unless self.hash_id.present?
    end
  end
end
