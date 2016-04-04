class Profile < ActiveRecord::Base
  belongs_to :user

  validates :first_name, presence: true, unless: "last_name.present?"
  validates :last_name, presence: true, unless: "first_name.present?"
  # validates :gender, inclusion: %w(male female)

  validate :has_gender, :last_name_sue

  def has_gender
  	if !(gender == "male" || gender == "female")
  		errors.add(:gender, "Gender must be male or female.")
  	end
  end

  def last_name_sue
  	if (gender == "male" and first_name == "Sue")
  		errors.add(:gender, "This is not allowed according to instructions.")
  		errors.add(:first_name, "This isn't allowed.")
  	end
  end

  def self.get_all_profiles(min, max)
  	Profile.where("birth_year BETWEEN ? AND ?", min, max).order(birth_year: :asc)
  end

end
