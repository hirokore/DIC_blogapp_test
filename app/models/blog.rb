class Blog < ApplicationRecord
    with_options presence: true do
        validates :title
        validates :content
    end
    validates :content, length:{ minimum: 1 }
    validates :content, length:{ maximum: 140 }
end
