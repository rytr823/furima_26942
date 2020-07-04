class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.?[a-z])(?=.?\d)[a-z\d]{6,100}+\z/i, message: "は半角英数字混合で入力してください。"}
  validates :password_confirmation, format: { with: /\A(?=.?[a-z])(?=.?\d)[a-z\d]{6,100}+\z/i, message: "は半角英数字混合で入力してください。"}
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力して下さい。'}
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力して下さい。'}
  validates :family_name_katakana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :last_name_katakana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :birthday, presence: true
end