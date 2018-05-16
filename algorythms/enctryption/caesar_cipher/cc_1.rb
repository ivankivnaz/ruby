ALPHABET_SIZE = 26

def caesar_cipher(string)
  shiftyArray = []
  charLine = string.chars.map(&:ord)

  shift = 1
  ALPHABET_SIZE.times do |shift|
    shiftyArray << charLine.map do |c|
      ((c + shift) < 123 ? (c + shift) : (c + shift) - 26).chr
    end.join
  end

  shiftyArray
end

puts caesar_cipher("testing")


def caesar_cipher2(string, shift = 1)
  alphabet   = Array('a'..'z')
  encrypter  = Hash[alphabet.zip(alphabet.rotate(shift))]
  string.chars.map { |c| encrypter.fetch(c, " ") }
end

p caesar_cipher("testing").join


def caesar_cipher3(string, shift = 1)
  alphabet  = Array('a'..'z')
  non_caps  = Hash[alphabet.zip(alphabet.rotate(shift))]
  
  alphabet = Array('A'..'Z')
  caps     = Hash[alphabet.zip(alphabet.rotate(shift))]
  
  encrypter = non_caps.merge(caps)
  
  string.chars.map { |c| encrypter.fetch(c, c) }
end

p caesar_cipher("testingzZ1Z").join
