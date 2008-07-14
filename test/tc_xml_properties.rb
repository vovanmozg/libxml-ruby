require "libxml"
require 'test/unit'

# Properties is deprecated - use attributes instead.
# Tests for backwards compatibility

class TestProperties < Test::Unit::TestCase
  def setup()
    xp = LibXML::Parser.string('<ruby_array uga="booga" foo="bar"><fixnum>one</fixnum><fixnum>two</fixnum></ruby_array>')
    @doc = xp.parse
  end

  def teardown()
    @doc = nil
  end

  def test_traversal
    properties = @doc.root.properties
    
    assert_instance_of(LibXML::Attributes, properties)
    attribute = properties.first
    assert_equal('uga', attribute.name)
    assert_equal('booga', attribute.value)

    attribute = attribute.next
    assert_instance_of(LibXML::Attr, attribute)
    assert_equal('foo', attribute.name)
    assert_equal('bar', attribute.value)
  end
  
  def test_each_attr
    @doc.root.properties.each_attr do |attribute|
      assert_instance_of(LibXML::Attr, attribute)
    end
  end
  
  def test_no_properties
    properties = @doc.root.child.properties
    assert_instance_of(LibXML::Attributes, properties)
    assert_equal(0, properties.length)
  end
end