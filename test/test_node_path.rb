# encoding: UTF-8

require_relative './test_helper'

class TestNodePath < Minitest::Test
	def test_path_memory
		node = LibXML::XML::Node.new('node')
		10000.times do
			node.path
		end
	end
end
