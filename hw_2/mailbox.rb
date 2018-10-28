require './email'

class Mailbox

  def initialize(name, emails)
    @name = name
    @emails = emails
  end

  def name
    @name
  end

  def info_keys
    @emails[0].emails_keys
  end

  def info_values
    @emails.map {|email| email.emails_values.join("</td>\n        <td>")}
  end

  def result
    @emails.each {|email| puts email.result}
  end
end



=begin

require './mailbox'
emails = [Email.new("Homework this week", {date: "24-10-2018", from: "Ferdous"}), Email.new("Keep on coding! :", {date: "24-10-2018", from: "Dajana"}), Email.new("Re: Homework this week", {date: "24-10-2018", from: "Ariane"})]
mailbox = Mailbox.new("Ruby Study Group", emails)
mailbox.result

=end