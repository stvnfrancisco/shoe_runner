class Shoe < ActiveRecord::Base
  has_and_belongs_to_many :stores
  validates(:title, :presence => true)
  validates(:title, :uniqueness => true)
  before_save(:capitalize)

private
  define_method(:capitalize) do
      self.title=(title().downcase().capitalize)
  end
end
