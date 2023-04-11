class Prototype < ApplicationRecord
  # バリデーション
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy

  # ActiveStorageの設定
  has_one_attached :image

  # 画像の存在チェックバリデーション
  validate :image_presence

  private
  #画像がないと投稿できない設定
  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end
end
