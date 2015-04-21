require 'minitest/autorun'

class TestCheersIntegration < MiniTest::Test

  def test_help_message
    output = `./cheers`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers.rb [Name] [MM/DD Brithday]
EOS

    assert_equal expected, output
  end

end