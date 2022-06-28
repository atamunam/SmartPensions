require 'checker'

describe Checker  do
	describe '#initialize' do
		context "passing a wrong file as an argument and receiving an error" do
			it 'throws error if a the file name is wrong' do
				expect { Checker.new }.to raise_error(ArgumentError)
			end
		end
	end

	describe '#views' do
		context "passing a file as an argument and receiving the desired output" do
			let(:checker) { Checker.new(File.new(File.join('webserver.log'))) }

			it 'printing list of webpages with views in ordered form' do
				expect(checker.views('total')).to eq([{"/about/2"=>90}, {"/contact"=>89}, {"/index"=>82}, {"/about"=>81}, {"/help_page/1"=>80}, {"/home"=>78}])
			end

			it 'prints list of webpages with uniq views in ordered form' do
				expect(checker.views('uniq')).to eq([{"/index"=>23}, {"/home"=>23}, {"/contact"=>23}, {"/help_page/1"=>23}, {"/about/2"=>22}, {"/about"=>21}])
			end
		end
	end
end