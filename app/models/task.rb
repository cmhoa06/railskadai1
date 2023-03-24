class Task < ApplicationRecord
    validates :content, 
        presence: true,
        length: { maximum: 20 }
    
    validates :start_at, 
        presence: true
    
    validates :end_at, 
        presence: true

    validate :start_finish_check

    validates :memo, 
        length: { maximum: 500 }

        def start_finish_check
            errors.add(:end_at,"は翌日以降の日にちを選択して") if end_at < start_at
        end

end
