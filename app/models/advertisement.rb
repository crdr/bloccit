# == Schema Information
#
# Table name: advertisements
#
#  id         :integer          not null, primary key
#  title      :string
#  copy       :text
#  price      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Advertisement < ActiveRecord::Base
end
