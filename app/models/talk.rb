class Talk < ActiveRecord::Base

        dragonfly_accessor :image

        belongs_to :speaker
        validates :title, :description, :start, :finish, presence: true
        validate :start_is_before_finish

        before_save :generate_slug

        private

        def start_is_before_finish
            return unless start.present? && finish.present?
            errors.add(:finish, 'Deve ser após o início da palestra') if finish <= start
        end

        def generate_slug
            self.slug = title.parameterize
        end
end
