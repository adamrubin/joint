require 'set'
require 'mime/types'
require 'wand'
require 'active_support/concern'

module Joint
  extend ActiveSupport::Concern

  included do
    class_attribute :attachment_names, :joint_collection_name
    self.attachment_names = Set.new
    include attachment_accessor_module
    self.joint_collection_name = 'fs'
  end

private
  def self.blank?(str)
    str.nil? || str !~ /\S/
  end
end

require 'joint/class_methods'
require 'joint/instance_methods'
require 'joint/attachment_proxy'
require 'joint/io'
require 'joint/file_helpers'
