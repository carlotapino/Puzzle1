require 'ruby-nfc'
class Rfid

	@@readers = NFC::Reader.all


	def read_uid
		@@readers[0].poll(Mifare::Classic::Tag) do |tag|
		begin
			uid = tag.uid_hex.upcase
			return uid
		end
		end
	end
end

if __FILE__ == $0
	rf = Rfid.new
	puts "Si us plau, apropeu la targeta al lector"
	uid = rf.read_uid
	puts uid
end
