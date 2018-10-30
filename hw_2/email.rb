require 'csv'

class Email
  def initialize(subject, headers)
    @subject = subject
    @headers = headers
  end

  def emails_keys
    @emails_keys_arr = ["Subject: "]
    @headers.each {|key, _| @emails_keys_arr << "#{key.to_s.capitalize}:    "}
    @emails_keys_arr
  end

  def emails_values
    @emails_values_arr = [@subject]
    @headers.each {|_, value| @emails_values_arr << value}
    @emails_values_arr
  end

  def result
    @headers.each do |key, value|
      puts "#{key.to_s.capitalize}:    #{value}"
    end
    puts "Subject: #{@subject}"
  end

  def add
    @emails_values_arr = []
    @headers.each {|_, value| @emails_values_arr << value}
    @emails_values_arr << @subject
    CSV.open("emails.csv", "wb") do |csv|
       csv << @emails_values_arr
    end
  end

end

=begin

require './email'
email = Email.new("Homework this week", {date: "24-10-2018", from: "Vova"})
email.result

email.add
New record was added to emails.csv file!

=end