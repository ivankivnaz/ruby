class CaesarCipher
  attr_reader :shift

  def initialize(shift: 1)
    raise ArgumentError unless shift.is_a? Integer
    @shift = shift
  end

  def encrypt(text)
    text.tr(alphabet, cipher)
  end

  def decrypt(text)
    text.tr(cipher(true), alphabet)
  end

  private

  def alphabet
    [*('a'..'z'), *('A'..'Z')].join
  end

  def cipher(dec = false)
    fix_shift = dec ? (0 - shift) : shift
    alphabet.chars.rotate(fix_shift).join
  end
end 

cc = CaesarCipher.new({shift: 3})
encrypted = cc.encrypt('test')
decrypted = cc.decrypt(encrypted)
puts encrypted
puts decrypted
