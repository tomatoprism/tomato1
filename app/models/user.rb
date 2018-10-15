class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  after_create :create_cart

         has_many :reviews
         has_one :cart

   acts_as_paranoid

   
		  validates_presence_of   :email
		  #validates_uniqueness_of :email, allow_blank: true, if: :email_changed?
		 # validates_format_of     :email, with: email_regexp
		  validates_presence_of     :password
		  validates_confirmation_of :password
		  validates :password,
		  length: { minimum: 6, maximum: 128 }
		

	validates :email, uniqueness_without_deleted: true, allow_blank: true, if: :email_changed?
	validates :name,:name_kana, :email, :phone, :password, :post_code, :address presence: true
	validates :name, length: { minimum:2, maximum: 20 }
  validates :Introduction, length: { maximum: 50 }
  
end
