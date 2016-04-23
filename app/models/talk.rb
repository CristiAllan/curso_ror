class Talk < ActiveRecord::Base
        validates :title, :description, :start, :finish, presence: true
        validate :start_is_before_finish

        private

        def start_is_before_finish
            return unless start.present? && finish.present?
            errors.add(:finish, 'Deve ser após o início da palestra') if finish <= start
        end
end
