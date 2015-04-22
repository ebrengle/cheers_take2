require_relative 'helper'

class TestCheersIntegration < MiniTest::Test



#Two Valid Arguments
  def test_two_valid_arguments
    output = `./cheers Abby 08/25`
    expected = <<EOS
Give me an...A
Give me an...B
Give me an...B
Give me an...Y

Abby's just GRAND!

Awesome! Your birthday is in 127 days! Happy Birthday in advance!
EOS
  assert_equal expected, output
  end



#No Arguments Given
  def test_no_arguments_given
    output = `./cheers`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers.rb [Name] [MM/DD Brithday]
EOS
  assert_equal expected, output
  end



#One Valid Argument
  def test_one_valid_argument_name
    output = `./cheers Abby`
    expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Abby’s just GRAND!

I would wish you a Happy Birthday, if I knew when that was!
EOS
    assert_equal expected, output
  end



#Non Letter Characters In Name
def test_only_non_word_characters_in_name
    output = `./cheers *!?`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers.rb [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end



#Empty String for Name
  def test_no_characters_in_name
    output = `./cheers ""`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers.rb [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end



#An Letter Tests
   def test_all_an_letters
    output = `./cheers AEFHILMNORSX`
    expected = <<EOS
Give me an... A
Give me an... E
Give me an... F
Give me an... H
Give me an... I
Give me an... L
Give me an... M
Give me an... N
Give me an... O
Give me an... R
Give me an... S
Give me an... X
AEFHILMNORSX’s just GRAND!

I would wish you a Happy Birthday, if I knew when that was!
EOS
    assert_equal expected, output
  end



#Name with hyphen in it
  def test_one_valid_argument_with_hyphenated_name
    output = `./cheers Mary-Jane`
    expected = <<EOS
Give me an... M
Give me an... A
Give me an... R
Give me a... Y
Give me a... J
Give me an... A
Give me an... N
Give me an... E
Mary-Jane’s just GRAND!

I would wish you a Happy Birthday, if I knew when that was!
EOS
    assert_equal expected, output
  end


#Name with a space in it
 def test_one_valid_argument_with_double_name
    output = `./cheers "Mary Jane"`
    expected = <<EOS
Give me an... M
Give me an... A
Give me an... R
Give me a... Y
Give me a... J
Give me an... A
Give me an... N
Give me an... E
Mary Jane’s just GRAND!

I would wish you a Happy Birthday, if I knew when that was!
EOS
    assert_equal expected, output
  end


  #   * valid + invalid
  def first_argument_valid_second_invalid
    output = `./cheers Abby x3/ar`
    expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Abby’s just GRAND!

I couldn't understand that. Could you give that to me in mm/dd format?
EOS
  assert_equal expected, output
  end

  #   * invalid + valid
def first_argument_invalid_second_valid
  output = `./cheers 1234 10/05`
  expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers.rb [Name] [MM/DD Brithday]
EOS
  assert_equal expected, output
  end


  # Invalid Names:
  #   * birthday instead of name
  def test_birthday_instead_of_name
    output = `./cheers 12/13  Abby`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers.rb [Name] [MM/DD Brithday]
EOS
  assert_equal expected, output
  end


  # Valid Months:
  #   * m/dd (8/25)
  def test_valid_months_m_dd
    output = `./cheers Abby 8/25`
    expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Abby’s just GRAND!

Awesome! Your birthday is in 127 days! Happy Birthday in advance!
EOS
  assert_equal expected, output
  end

  #   * mm/dd (08/25)
  def test_valid_months_mm_dd
    output = `./cheers Abby 08/25`
    expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Abby’s just GRAND!

Awesome! Your birthday is in 127 days! Happy Birthday in advance!
EOS
  assert_equal expected, output
  end

  #   * birthdays that already happened this year
  def birthday_already_happened
    output = `./cheers Abby 08/25`
    expected = <<EOS
Give me an...A
Give me an...B
Give me an...B
Give me an...Y
Abby's just GRAND!

Awesome! Your birthday is in 127 days! Happy Birthday in advance!
EOS
  assert_equal expected, output
  end


  #   * birthdays that haven't happened yet this year
 def birthday_havent_already_happened
    output = `./cheers Abby 08/25`
    expected = <<EOS
Give me an...A
Give me an...B
Give me an...B
Give me an...Y
Abby's just GRAND!

Awesome! Your birthday is in 127 days! Happy Birthday in advance!
EOS
  assert_equal expected, output
  end


  # Invalid Months:
  #   * dd/mm (25/08)
  def test_invalid_months_dd_mm
    output = `./cheers Abby 25/08`
    expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Abby’s just GRAND!

I couldn't understand that. Could you give that to me in mm/dd format?
EOS
  assert_equal expected, output
  end


  #   * dd/mm/yy (08/25/2015)
  def test_invalid_months_dd_mm_yy
    output = `./cheers Abby 08/25/2015`
    expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Abby’s just GRAND!

I couldn't understand that. Could you give that to me in mm/dd format?
EOS
  assert_equal expected, output
  end


end