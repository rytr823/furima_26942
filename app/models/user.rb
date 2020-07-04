class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.?[a-z])(?=.?\d)[a-z\d]{6,100}+\z/i, message: 'は半角英数字混合で入力してください。' }
  validates :password_confirmation, format: { with: /\A(?=.?[a-z])(?=.?\d)[a-z\d]{6,100}+\z/i, message: 'は半角英数字混合で入力してください。' }

  with_options presence: true do |assoc|
    assoc.validates :nickname
    assoc.validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力して下さい。' }
    assoc.validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力して下さい。' }
    assoc.validates :family_name_katakana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'はカタカナで入力して下さい。' }
    assoc.validates :last_name_katakana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'はカタカナで入力して下さい。' }
    assoc.validates :birthday
  end
end
