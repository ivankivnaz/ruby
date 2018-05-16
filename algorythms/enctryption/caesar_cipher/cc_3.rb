class CaesarCipherizer
  def initialize(shift = nil)
    @shift = shift.to_i
  end

  def encrypt(text)
    text.tr(alphabet, cipher)
  end

  def decrypt(text)
    text.tr(cipher, alphabet)
  end

  private
  attr_reader :shift

  def alphabet
    Alphabet.to_s
  end

  def cipher
    CaesarCipher.new(shift: shift).to_s
  end
end

class CaesarCipher
  def initialize(shift: 0)
    raise ArgumentError unless shift.is_a? Integer
    @shift = shift
  end

  def to_s
    Alphabet.to_a.rotate(shift).join
  end

  private
  attr_reader :shift
end

module Alphabet
  def self.to_a
    [*('a'..'z'), *('A'..'Z')]
  end

  def self.to_s
    to_a.join
  end
end


#~-~-~-~#

require 'minitest/autorun'

describe 'CaesarCipherizer' do
  subject { CaesarCipherizer.new(shift) }
  let(:shift) { nil }

  describe "#encrypt" do
    describe "with no shift specified" do

      it "should return the original string" do
        assert_equal "Hello", subject.encrypt("Hello")
        assert_equal "Testing", subject.encrypt("Testing")
      end
    end

    describe "with a shift of 1 specified" do
      let(:shift) { 1 }

      it "should return the correct string" do
        assert_equal "Ifmmp", subject.encrypt("Hello")
        assert_equal "Uftujoh", subject.encrypt("Testing")
      end
    end

    describe "with a shift of 5 specified" do
      let(:shift) { 5 }

      it "should return the correct string" do
        assert_equal "Mjqqt", subject.encrypt("Hello")
        assert_equal "doCDsxq", subject.encrypt("Yjxynsl")
      end
    end
  end

  describe '.shift' do
    describe "with no shift specified" do

      it "should be inaccessible" do
        assert_raises(NoMethodError) { subject.shift }
      end
    end

    describe "with a shift of 1 specified" do
      let(:shift) { 1 }

      it "should still be totallyl inaccessible" do
        assert_raises(NoMethodError) { subject.shift }
      end
    end
  end
end

describe 'CaesarCipher' do
  subject { CaesarCipher.new(shift: shift) }

  let(:shift) { nil }

  it "should be not give away its shift" do
    assert_raises(ArgumentError) { subject.shift }
  end

  describe "#to_s" do
    describe "with a hil input" do
      it "should repeat back the alphabet" do
        assert_equal "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", CaesarCipher.new.to_s
      end
    end

    it "should not give away its shift" do
      assert_raises(NoMethodError) { CaesarCipher.new.shift }
    end

    describe "with a 0 input" do
      let(:shift) { 0 }
      it "should repeat back the alphabet" do
        assert_equal "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", subject.to_s
      end

      it "should not give away its shift" do
        assert_raises(NoMethodError) { subject.shift }
      end
    end

    describe "with a 1 input" do
      let(:shift) { 1 }
      it "should repeat back the alphabet shifted one across" do
        assert_equal "bcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZa", subject.to_s
      end

      it "should not give away its shift" do
        assert_raises(NoMethodError) { subject.shift }
      end
    end
  end
end
